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
W ramach tworzenia konkurencyjnej wersji - opracowuję kolejny plik Dockerfile - używając obrazu httpd.
> Zbudowanie obrazu na bazie utworzonego pliku o nazwie Dockerfile1
```
docker build -t httpd_fibcalc -f Dockerfile1 .
```
> Uruchomienie kontenera na bazie httpd_fibcalc - przkierowanie portu 80
```
docker run -dit --rm --name httpd_fibcalc -p 80:80 httpd_fibcalc
```


### Rozwiązanie nr. 3 - Nginx obraz - plik /public-html/index.html - 86,6MB
> Zbudowanie obrazu na bazie utworzonego pliku o nazwie Dockerfile2
```
docker build -t nginx_fibcalc -f Dockerfile2 .
```
> Uruchomienie kontenera na bazie httpd_fibcalc - przkierowanie portu 80
```
docker run -dit --rm --name nginx_fibcalc -p 80:80 nginx_fibcalc
```


### Rozwiązanie nr. 4 - bash