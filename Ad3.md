# Operacje z GitHub Actions, Docker.io, Github.com

## Tworzenie secrets
W celu udzielenia dostępu do docker.io - podczas budowania obrazu, generuję nowy Access Tokens.

> [Strona tworząca access tokens](https://hub.docker.com/settings/security)

> [Strona tworząca token dla registry](https://github.com/settings/tokens)

[Pomocnik do platformy M1](https://plainenglish.io/blog/which-docker-images-can-you-use-on-the-mac-m1-daba6bbc2dc5)



## Wersjonowanie semantyczne użyte podczas tagowania - krótki opis
Zgodnie z [dołączonym do zadania materiałem](https://semver.org/lang/pl/), używam wersjonowania semver.

> Numer wersji/symbolika -- MAJOR(X).MINOR(Y).PATCH(Z)
* MAJOR(X) - inkrementowany, gdy dokonaliśmy zmian nie wykazujących kompatybilności z API,
* MINOR(Y) - inkrementowana, gdy dodajemy nową funkcjonlaność - zgodną z poprzednimi wersjami,
* PATCH(Z) - inkrementowana, gdy poprawiamy błędy - nie zrywając kompatybilności.

## Krótkie omówienie fib.yml
1. Ustawienie runner-a - system Ubuntu-20.04
```
runs-on: ubuntu-20.04
```
2. Silnik buildkit
```
 - 
        name: Buildx set-up
        id: buildx
        uses: docker/setup-buildx-action@v2
```
3. Umożliwienie uruchomienia aplikacji na Intel 64 oraz Apple M1
```
platforms: linux/amd64,linux/arm64
```

> Ze względu na kilka plików Dockerfile - w fib.yml dodaję regułkę wskazującą nazwę pliku
```
file: ./Dockerfile3
```
