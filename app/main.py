from typing import Union
from fastapi import FastAPI

app = FastAPI()

def fib(n: int):
    try:
        n = int(n)
    except ValueError:
        return 0
    if isinstance(n, int) and n>0:
        if n == 0: return 0
        elif n == 1: return 1
        return fib(n-1) + fib(n-2)
    else:
        return 0

@app.get("/{n}")
def main(n: int):
    return ('Wynik= '+str(fib(n))+' - Kacper Kisielewski - 2.2GR')