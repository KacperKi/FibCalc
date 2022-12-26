Tworzę folder, który posłuży do dalszej pracy z aplikacją web. Odpowiednio w pliku requirements.txt, dołączam 
wymagane komponenty z wersjami do jej funkcjonowania.

Do uruchomienia korzystam z platformy do interfejsuów api w pythonie - FastAPI.

Zbudowanie obrazu na bazie utworzonego Dockerfile
```
docker build -t fibcalc -f Dockerfile .
```
Uruchomienie kontenera na bazie utworzonego obrazu
```
docker run -d --name fibcalc_app -p 80:80 fibcalc
```
Zgodnie ze zmodyfikowanym plikiem main.py w folderze /app. 

Wynik n-tego ciągu uzyskamy poprzez odwołanie http://localhost/{numer_n_ciagu}

W ramach konkurencyjnej wersji najmniejszego obrazu - zmieniam program oraz formę jego

docker pull httpd:2.4.23-alpine

