if status --is-login
    set -gx PATH $PATH ~/.local/bin
end
if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

