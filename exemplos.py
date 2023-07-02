def encontrar_numeros_repetidos(lista1, lista2):
    conjunto = set(lista1)
    numeros_repetidos = []

    for elemento in lista2:
        if int(elemento) in conjunto:
            numeros_repetidos.append(int(elemento))

    return numeros_repetidos


lista1 = [1, 3, 5, 6, 8, 9, 10, 12, 15, 16, 19, 20, 21, 22, 25]
entrada = input("Digite os números separados por espaço: ")
lista2 = entrada.split()

resultado = encontrar_numeros_repetidos(lista1, lista2)

if len(resultado) < 11:
    print(f'Não ganhou {len(resultado)} Acertos {resultado}')
else:
    print(f'Ganhou {len(resultado)} Acertos {resultado}')