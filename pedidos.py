numPedidos = 2
lista = []
for i in range(1, numPedidos + 1):
    prato = input('Digite o prato: ')
    calorias = int(input('Digite as calorias'))
    vegano = str(input('é vegano? '))
    ehVegano = False

    if vegano == 's':
        ehVegano = True

    if ehVegano == True:
        ehVegano = '(vegano)'
        lista.append("pedido {}: {} {} - {} calorias".format(i, prato, ehVegano, calorias))

print(lista[0])
print(lista[1])