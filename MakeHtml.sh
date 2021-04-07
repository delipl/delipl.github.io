#!/bin/bash
dirs=($(find Strony/  -name "Lekcja*" -type d ))

upHtml="<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>

"
inds=($(find ./Strony/  -name "index.html" -type f ))

for i in "${inds[@]}"; do
  rm  $i
  touch  $i
  echo $upHtml >> $i
done


for dir in "${dirs[@]}"; do
  # echo $dir
  html=($(find $dir  -name "*html" -type f  ))
  index=($dir/../index.html) 
  # rm  $index
  # touch  $index
  # echo $upHtml >> $index

  for f in $html; do
    echo "<a href='" >> $index
    
    echo $f | cut -d'/' -f4- >> $index
    echo "'>" >> $index
    echo $f | cut -d'/' -f5- >> $index
    echo "</a><br>" >> $index
  done
  # echo "</body></html>" >> $index
done

for i in "${inds[@]}"; do
  echo "</body></html>" >> $i
done