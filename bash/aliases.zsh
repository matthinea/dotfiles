# see all files in current directory and their LOC, ordered by LOC
loc() {
  find ./** -type f -exec wc -l {} + | sort -rn
}

samp() {
  eval filename="$1"
  cat $1 | head -n 10000 > "${filename%.*}_sample.csv"
}
