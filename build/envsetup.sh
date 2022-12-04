function __print_omni_functions_help() {
cat <<EOF
Additional JARVIS-ROM functions:
- mka:             Make using all available CPUs.
- repopick:        Utility to fetch changes from Gerrit.
EOF
}

function mka() {
    m "$@" -j `cat /proc/cpuinfo | grep "^processor" | wc -l`
}

function brunch()
{
    breakfast $*
    if [ $? -eq 0 ]; then
        mka jarvis
    else
        echo "No such item in brunch menu. Try 'breakfast'"
        return 1
    fi
    return $?
}

function breakfast()
{
    target=$1
    local variant=$2

    if [ $# -eq 0 ]; then
        # No arguments, so let's have the full menu
        lunch
    else
        if [[ "$target" =~ -(user|userdebug|eng)$ ]]; then
            # A buildtype was specified, assume a full device name
            lunch $target
        else
            # This is probably just the JARVIS model name
            if [ -z "$variant" ]; then
                variant="user"
            fi

            lunch jarvis_$target-$variant
        fi
    fi
    return $?
}

function repopick() {
    set_stuff_for_environment
    T=$(gettop)
    $T/vendor/jarvis/build/tools/repopick.py $@
}
