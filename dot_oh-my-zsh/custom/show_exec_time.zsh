function preexec() {
  # milliseconds since epoch
  timer=$(($(date +%s%N) / 1000000))
}

function precmd() {
  if [[ -n $timer ]]; then
    now=$(($(date +%s%N) / 1000000))
    diff_ms=$(( now - timer ))
    diff_s=$(( diff_ms / 1000 ))
    diff_rem_ms=$(( diff_ms % 1000 ))

    RPROMPT="%F{cyan}${diff_s}.$(printf '%03d' $diff_rem_ms)s%{$reset_color%}"
    unset timer
  fi
}
