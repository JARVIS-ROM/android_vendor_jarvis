function __print_omni_functions_help() {
cat <<EOF
Additional JARVIS-ROM functions:
- repopick:        Utility to fetch changes from Gerrit.
EOF
}

function repopick() {
    set_stuff_for_environment
    T=$(gettop)
    $T/vendor/jarvis/build/tools/repopick.py $@
}
