# Punkt nr. 2
W ramach tego punktu, prezentuję kilka rozwiązań, ponieważ dążyłem do minimalnego rozmiaru.

## Rozwiązanie nr. 1 - Python, FastAPI - 971,23MB rozmiar
Rozwiązanie polega na wdrożeniu pliku z zadania nr. 1 w Pythonie.Tworzę folder, który posłuży do dalszej pracy z aplikacją web. Odpowiednio w pliku requirements.txt, dołączam wymagane komponenty z wersjami do jej funkcjonowania.
Do uruchomienia korzystam z platformy do interfejsuów api w pythonie - FastAPI.
### Polecenia do uruchomienia pliku main.py - folder ./app oraz requirements.txt
> Zbudowanie obrazu na bazie utworzonego pliku o nazwie Dockerfile
```
docker build -t python_fibcalc -f Dockerfile .
```
> Uruchomienie kontenera na bazie utworzonego obrazu
```
docker run -d --rm --name python_fibcalc -p 80:80 python_fibcalc
```
> Zgodnie ze zmodyfikowanym plikiem main.py w folderze /app. 
> Wynik n-tego ciągu uzyskamy poprzez wpis w przeglądarce
```
http://localhost/{numer_n_ciagu}
```


### Rozwiązanie nr. 2 - Httpd obraz - folder /public-html wraz z plikiem index.html - 86,6MB
W ramach tworzenia konkurencyjnej wersji - opracowuję kolejny plik Dockerfile - używając obrazu httpd. Do niego opracowuję plik index.html w folderze public-html.
Plik - to proste przedstawienie inputa oraz javascriptu. Funkcja wykonująca podczas kliknięcia przycisku - wykonuje obliczenia oraz prezentując okienko z wynikiem i danymi.

> Zbudowanie obrazu na bazie utworzonego pliku o nazwie Dockerfile1
```
docker build -t httpd_fibcalc -f Dockerfile1 .
```
> Uruchomienie kontenera na bazie httpd_fibcalc - przkierowanie portu 80
```
docker run -dit --rm --name httpd_fibcalc -p 80:80 httpd_fibcalc
```


### Rozwiązanie nr. 3 - Nginx obraz - plik /public-html/index.html - 11,51MB
Opcja nr. 3 to rozwiązanie z wykorzystaniem pliku z zadania nr. 2, bazowym obrazem jest nginx - bazującym na Alpine w wersji mainline-alpine-slim.
> Zbudowanie obrazu na bazie utworzonego pliku o nazwie Dockerfile2
```
docker build -t nginx_fibcalc -f Dockerfile2 .
```
> Uruchomienie kontenera na bazie httpd_fibcalc - przkierowanie portu 80
```
docker run -dit --rm --name nginx_fibcalc -p 80:80 nginx_fibcalc
```


### Rozwiązanie nr. 4 - alpine:3.5, fib.sh - 4MB
Rozwiązanie ostatnie - najmniejszy rozmiar jaki uzyskałem to 4MB. To utworzony obraz ze skopiowanym w Dockerfile plikiem fib.sh.

> Zbudowanie obrazu na bazie utworzonego pliku o nazwie Dockerfile3. 
```
 docker build -t alpine_fibcalc -f Dockerfile3 .
```
> Uruchomienie kontenera na bazie alpine_fibcalc
```
winpty docker run -it --rm --name alpine_fibcalc alpine_fibcalc
```

## Podsumowanie zadania nr.2
Najmniejszy rozmiar obrazu jaki zdołałem uzyskać to obraz z użyciem Alpine w wersji 3.5, dodatkowo został utworzony skrypt fib.sh, który w pętli - po uruchomieniu kontenera,
pobiera w nieskończoność liczbę - oznaczającą n-ty element ciągu Fibonacciego.
> Poprzednie wersje pozostawiam w ramach prezentacji metod wdrożenia skryptu.