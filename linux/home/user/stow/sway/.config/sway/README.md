# Sway config

Config files for Sway tiling Wayland compositor.

# Setup for a new machine

To set up this configuration on a new machine:
1. Create a `local/` directory, and add only necessary local settings (e.g. `local/040-outputs.conf` for screen setup, `local/020-inputs.conf` for touchpad, etc.).
2. Copy `config.tmpl` to `config`, and edit it to include your local settings in the correct order.

# Structure

*   **`config.tmpl`**: The template for the main sway config file. It orchestrates the modular layout using sequential `include` directives.
*   **`components/`**: Universal configurations that apply to every system (e.g., standard keybindings, status bars, default settings, general window rules).
*   **`local/`**: Per-machine, system-specific settings (e.g., specific monitor layout and wallpapers, custom input device sensitivities, specific workspaces to display mappings). **This directory is intended to be git-ignored or customized individually per machine.**

## The Numbered Prefix Convention

Files in `components/` and `local/` are named with a 3-digit numeric prefix (`020`, `040`, `100`, `200`, etc.). These numbers are used to indicate their order of inclusion, and for easier pairing between component and local files (e.g., `components/020-inputs.conf` and `local/020-inputs.conf`). Globbing is not used, instead each file is included explicitly in the main `config` file.

## Config Files Structure & Map

Here is the sequential order of how the configurations are loaded:

| Load Order | Segment | Component Config File | Local Override File | Description |
| :--- | :--- | :--- | :--- | :--- |
| **020** | **Inputs** | `components/020-inputs.conf` | `local/020-inputs.conf` | Keyboard repeat rates, layout, compositing, and pointer/touchpad/tablet sensitivity. |
| **040** | **Outputs** | `components/040-outputs.conf` | `local/040-outputs.conf` | Wildcard and specific output monitor resolution, position, rotation, and wallpapers. |
| **060** | **Look & Feel** | `components/060-look_and_feel.conf` | *N/A* | Global font, seat cursor styling, border styles, and general i3 edge/marks settings. |
| **100** | **Keybindings** | `components/100-sway_keybindings.conf` | *N/A* | Lock-screen, window focus/movement, tiling/layout controls, scratchpad, launcher, and terminal keys. |
| **200** | **Menus (Shared)** | `components/200-sway_menus.conf` | `local/200-sway_menus.conf` | Shared variables, separator symbols, and main menu modes configurations. |
| **210** | **Container Menu** | `components/210-sway_submenu_container.conf` | *N/A* | Layout switching (stacking, tabbed, split) and swapping. |
| **215** | **Resize/Move** | `components/215-sway_submenu_resize_move.conf` | *N/A* | Resize floating presets, active window resizing, and keyboard-driven window positioning. |
| **220** | **Workspace Menu**| `components/220-sway_submenu_workspace.conf` | *N/A* | Moving workspaces between outputs. |
| **225** | **Gaps Menu** | `components/225-sway_submenu_gaps.conf` | *N/A* | Live inner and outer gap size adjustments. |
| **230** | **Opacity Menu** | `components/230-sway_submenu_opacity.conf` | *N/A* | Opacity presets and custom adjustments. |
| **235** | **Border Menu** | `components/235-sway_submenu_border.conf` | *N/A* | Border width pixel adjustments and layout toggling. |
| **240** | **Mouse Menu** | `components/240-sway_submenu_mouse.conf` | *N/A* | Cursor movement and action helpers (e.g. centering pointer on active window). |
| **245** | **Sway/Waybar Menu**| `components/245-sway_submenu_sway.conf` | *N/A* | Sway-specific reloads, config editing, and Waybar visibility toggle controls. |
| **250** | **System Menu** | `components/250-sway_submenu_system.conf` | *N/A* | Lock screen, exit, reboot, suspend, and shutdown options. |
| **255** | **Hardware Menu** | *N/A* | `local/255-sway_submenu_hardware.conf` | Monitor brightness, bluetooth control, printer management, etc. |
| **260** | **Tools Menu** | *N/A* | `local/260-sway_submenu_tools.conf` | Tools bindings such as screenshot controls. |
| **265** | **Apps Menu** | *N/A* | `local/265-sway_submenu_apps.conf` | Standard app sub-menus and launchers (Browsers, Koreader, Calibre, Kanata, Swhkd, Fcitx5). |
| **290** | **Menus (General)** | `components/290-sway_menus_general.conf` | `local/290-sway_menus_general.conf` | The main menu mode (`$mode_general` triggered via `$mod+m`) & custom user general menu binds. |
| **300** | **Status Bar** | `components/300-status_bar.conf` | *N/A* | Default Swaybar/Waybar position and color scheme settings. |
| **400** | **Window Rules** | `components/400-window_rules.conf` | `local/400-window_rules.conf` | Rules for specific app IDs/classes (floating modes, initial sizes, workspace assignments). |
| **500** | **Workspaces** | *N/A* | `local/500-workspaces.conf` | Machine-specific bindings forcing workspace indexes to specific display outputs. |
| **600** | **Swayidle** | `components/600-swayidle.conf` | *N/A* | Swayidle power management profiles (brightness dimming, lock-screen trigger, DPMS settings). |
| **800** | **Autostart** | `components/800-autostart.conf` | `local/800-autostart.conf` | Core background daemons (dbus systemd triggers, wl-gammarelay, dunst notification, polkit, IME). |
| **900** | **Final** | `components/900-final.conf` | `local/900-final.conf` | Final system configurations and local environment finishing setups. |
| **Global** | **System** | `/etc/sway/config.d/*` | *N/A* | Standard operating system package defaults. |

## How to Add Custom Menus in `local/`

Because Sway processes config directives top-down and merges identical `mode` definitions, you can seamlessly add your own custom sub-menus and bind them to the main `$mod+m` menu:

1.  **Define your custom sub-menu mode** in `local/200-sway_menus.conf`:
    ```swayconfig
    # 1. Optionally, expand the general menu description to include your custom trigger
    set $mode_general 󰘚 Menu: [s]ystem$menu_sep[h]ardware$menu_sep[t]ools$menu_sep[c]ontainer$menu_sep[r]esize/move$menu_sep[w]orkspace$menu_sep[g]aps$menu_sep[b]order$menu_sep[o]pacity$menu_sep[m]ouse$menu_sep[a]pps$menu_sep[y]sway$menu_sep[x]mycustom

    # 2. Define the sub-menu mode and its bindings
    set $mode_custom my[X]menu: [f]oo$menu_sep[b]ar
    mode "$mode_custom" {
        bindsym f exec notify-send "Foo pressed"; mode "default"
        bindsym b exec notify-send "Bar pressed"; mode "default"

        # exit mode
        bindsym Return mode "default"
        bindsym Escape mode "default"
    }
    ```

2.  **Bind your custom sub-menu to the main menu** in `local/290-sway_menus_general.conf`:
    ```swayconfig
    # Re-open the general menu to append the keybinding
    mode "$mode_general" {
        bindsym x mode "$mode_custom"
    }
    ```

Sway will merge your local mode bindings into the main general menu and show your custom descriptor on your Waybar/Swaybar perfectly!

