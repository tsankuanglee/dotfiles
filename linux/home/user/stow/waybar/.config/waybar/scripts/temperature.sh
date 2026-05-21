#!/usr/bin/env bash

# Find CPU Temperature (supports Intel coretemp and AMD k10temp)
cpu_temp=""
for f in /sys/class/hwmon/hwmon*/name; do
    if [ ! -f "$f" ]; then continue; fi
    name=$(cat "$f")
    if [[ "$name" == "coretemp" || "$name" == "k10temp" ]]; then
        dir=$(dirname "$f")
        if [ -f "$dir/temp1_input" ]; then
            cpu_temp=$(($(cat "$dir/temp1_input") / 1000))
            break
        elif [ -f "$dir/temp2_input" ]; then
            cpu_temp=$(($(cat "$dir/temp2_input") / 1000))
            break
        fi
    fi
done

# Find GPU Temperature (supports AMD amdgpu and NVIDIA/Nouveau nouveau)
gpu_temp=""
for f in /sys/class/hwmon/hwmon*/name; do
    if [ ! -f "$f" ]; then continue; fi
    name=$(cat "$f")
    if [[ "$name" == "amdgpu" || "$name" == "nouveau" ]]; then
        dir=$(dirname "$f")
        if [ -f "$dir/temp1_input" ]; then
            gpu_temp=$(($(cat "$dir/temp1_input") / 1000))
            break
        fi
    fi
done

# Format text for the bar
bar_text=""
if [ -n "$cpu_temp" ]; then
    bar_text="${cpu_temp}°C"
fi

if [ -n "$gpu_temp" ]; then
    if [ -n "$bar_text" ]; then
        bar_text="$bar_text 󰢮${gpu_temp}°C"
    else
        bar_text="󰢮${gpu_temp}°C"
    fi
fi

if [ -z "$bar_text" ]; then
    bar_text="N/A"
fi

# Build tooltip text with all available sensors
tooltip_text=""
for dir in /sys/class/hwmon/hwmon*; do
    if [ ! -d "$dir" ]; then continue; fi
    name=$(cat "$dir/name" 2>/dev/null)
    
    for temp_input in "$dir"/temp*_input; do
        if [ ! -f "$temp_input" ]; then continue; fi
        temp_val=$(($(cat "$temp_input" 2>/dev/null) / 1000))
        
        # Skip invalid/extreme error readings (e.g. -273C or > 150C)
        if (( temp_val < -20 || temp_val > 150 )); then
            continue
        fi

        label_file="${temp_input%_input}_label"
        if [ -f "$label_file" ]; then
            label=$(cat "$label_file")
            tooltip_text="${tooltip_text}${name} (${label}): ${temp_val}°C"$'\n'
        else
            idx=$(basename "$temp_input" | tr -cd '0-9')
            tooltip_text="${tooltip_text}${name} (temp${idx}): ${temp_val}°C"$'\n'
        fi
    done
done

# Escape backslashes and double quotes for JSON compatibility
escaped_tooltip=""
while IFS= read -r line; do
    if [ -n "$line" ]; then
        line_escaped=$(echo "$line" | sed 's/\\/\\\\/g' | sed 's/"/\\"/g')
        escaped_tooltip="${escaped_tooltip}${line_escaped}\\n"
    fi
done <<< "$tooltip_text"

# Strip trailing newline
escaped_tooltip="${escaped_tooltip%\\n}"

# Output JSON
echo "{\"text\": \"$bar_text\", \"tooltip\": \"$escaped_tooltip\"}"
