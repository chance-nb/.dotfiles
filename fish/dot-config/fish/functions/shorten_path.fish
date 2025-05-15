function shorten_path
  set -l path "$argv[1]"
  if string match -q "$HOME*" "$path"
    echo "~"(string replace -r "^$HOME" "" "$path")
  else
    echo "$path"
  end
end
