# alias ..='cd ..'
# see all files in current directory and their LOC, ordered by LOC
loc() {
  find ./** -type f -exec wc -l {} + | sort -rn
}
