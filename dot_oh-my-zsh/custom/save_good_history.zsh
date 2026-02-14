# Prevent the command from being written to the history file before it's executed; save it to LASTHIST instead.
# The return value 2 means "the history line will be saved on the internal
# history list, but not written to the history file".
function zshaddhistory() {
    # Remove line continuations
    LASTHIST=${1//\\\\$\'\\n\'/}
    return 2
}

# Zsh hook called before the prompt is printed.
function precmd() {
    # Write the last command if successful, using the history buffered by zshaddhistory()
    # $? is the exit status of the last command
    if [[ $? == 0 && -n ${LASTHIST//[[:space:]\\n]/} && -n $HISTFILE ]] ; then
        print -sr -- ${=${LASTHIST%%\'\\n\'}}
    fi
}
