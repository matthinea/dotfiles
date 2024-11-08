# see all files in current directory and their LOC, ordered by LOC
loc() {
  find ./** -type f -exec wc -l {} + | sort -rn
}

samp() {
  eval filename="$1"
  cat $1 | head -n 10000 > "${filename%.*}_sample.csv"
}

listening() {
    if [ $# -eq 0 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P
    elif [ $# -eq 1 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
    else
        echo "Usage: listening [pattern]"
    fi
}

jsonl_to_json() {
  for chunk in $1; do
     jq -s '.' "$chunk" > "${chunk}.json"
     rm "$chunk"
  done
}
