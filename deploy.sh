#!/usr/bin/env bash

note-link-janitor posts/

echo "<meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><link href='_css/style.css' rel='stylesheet'/><div id='content' class='homepage'><h1>$ ls /home/huy/notes/</h1><ul>" > index.html
FILES=posts/*.md
for f in $FILES
do
  FILE_NAME="${f%%.*}"
  echo "<li><a href='$FILE_NAME.html'>$FILE_NAME</a></li>" >> index.html
done
echo "</ul></div>" >> index.html

git add -A
git commit -m "Auto deploy"
git push
