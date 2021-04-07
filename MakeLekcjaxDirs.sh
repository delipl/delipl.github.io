#!/bin/bash
dirs=($(find Strony/ -not -name "Lekcja*"  -not -name "*0" -not -name "Strony" -not -name "~" -type d ))
for dir in "${dirs[@]}"; do
    for dupa in {1..8}  
    do
      name="$dir/Lekcja$dupa"
      echo $name
      mkdir $name
    done

done
