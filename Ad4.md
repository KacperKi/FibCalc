# Punkt 4 - git bash
## Weryfikacja pliku fib.yml
> W celu sprawdzenia, czy plik fib.yml znajduje się w repoztyrium / workflow stosuję polecenie.
```
 winpty gh workflow view -y
```

## Uruchomienie GitHub Action - tagowanie, przesyłanie tagów
Aby rozpocząć proces budowania / inicjowania pracy workflow-a, stosuję odpowiednio komendy
> 1 etap - dodałem do globalnego repozytrium workflowa - ścieżka .github/workflows
```
    git add .
    git add .github
    git commit -m "<name_of_commit>"
    git push
```
> 2 etap - tagowanie commita
``` 
    git tag <opt:id_of_commit>
    git push --tags
```
> git tag - polecenie pozwalające na wyświetlenie dostępnych tagów


## Uruchomienie Workflow-a / Github Action z narzędzia GH w Gitbashu.
> Uruchomienie workflow-a.
```
winpty gh wokrflow run
```
> Listowanie pracująych, zakończonych (wszsystkich) akcji
```
winpty gh run list --worflow=fib.yml
```
> Podgląd pracującego (oznaczonego gwiazdką w kolummnie STATUS)
```
winpty gh run view <id_action_from_listing> --log
```

## Pobranie obrazu z repozytorium
> Pobranie obrazu z okresloną platformą - 
```
docker pull --platform linux/amd64 ghcr.io/kacperki/fibcalc
```
lub 
```
docker pull ghcr.io/kacperki/fibcalc
```

## Uruchomienie aplikacji na bazie autorskiego obrazu
```
winpty docker run -it --rm --name fibcalc_private ghcr.io/kacperki/fibcalc
```

> MENU
*  [Wstęp do zadania](https://github.com/KacperKi/FibCalc/blob/main/Informacje%20wstepne.md)
*  [Idź do opisu zad 1 - Ad1.md](https://github.com/KacperKi/FibCalc/blob/main/Ad1.md).
*  [Idź do opisu zad 2 - Ad2.md](https://github.com/KacperKi/FibCalc/blob/main/Ad2.md).
*  [Idź do opisu zad 3 - Ad3.md](https://github.com/KacperKi/FibCalc/blob/main/Ad3.md).
*  [Idź do opisu zad 4 - Ad4.md](https://github.com/KacperKi/FibCalc/blob/main/Ad4.md).