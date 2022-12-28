#! /bin/sh
re="^[0-9]+$"
while true
do
    echo "Podaj n: "
    read n
    if [ $n -lt 0 ] ; then
      echo "Bledna wartosc";  
    else
      a=0;b=1;i=0;
      while [ "$i" -lt "$n" ]
      do
          c=$((a+b))
          a=$b
          b=$c
          i=$(( i + 1 ))
      done
      echo "Kacper Kisielewski Gr.2.2 - Wynik = $a"
    fi
    echo "Press Enter to next value ..."
    read tmp
    clear
done