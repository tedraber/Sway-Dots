if status is-interactive
    # Commands to run in interactive sessions can go here
set -Ux TERMINAL foot

set -Ux fish_user_paths $fish_user_paths /home/efe/.scripts
export GRIMSHOT_DIR="$HOME/Pictures/Screenshots"
fastfetch
end
