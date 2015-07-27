
for d in *; do
  if test -d $d; then
    mv $d what
    git ciam '.'
    mv what $d
    git add -f $d/*
    git ciam '_'
  fi
done

