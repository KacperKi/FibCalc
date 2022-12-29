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

> Ze względu na kilka plików Dockerfile - w fib.yml dodaję regułkę wskazującą nazwę pliku finalnego
```
file: ./Dockerfile3
```
4. Zbudowane obrazy przesyłam na publiczne repozytrium github.
```
 name: Docker meta
        id: meta
        uses: docker/metadata-action@v4
        with:
          images: |
            ghcr.io/kacperki/fibcalc
          tags: |
            type=ref,event=branch
            type=ref,event=pr
            type=semver,pattern={{version}}
            type=semver,pattern={{major}}.{{minor}}
```
5. Logowanie poprzez token
> Do githuba: 
```
        name: Login to GitHub
        uses: docker/login-action@v2
        with:
          registry: ghcr.io
          username: ${{secrets.GH_USERNAME}}
          password: ${{secrets.GH_TOKEN}}
```
> Do Dockerhuba:
```
        name: Login to DockerHub
        uses: docker/login-action@v2
        with:
          username: ${{secrets.DH_USERNAME}}
          password: ${{secrets.DH_TOKEN}}
```

T



[Czytaj dalej punkt 4](https://github.com/KacperKi/FibCalc/blob/main/Ad4.md)