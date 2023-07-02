texto = input('Digite um nome: ')
vogais = 'AEIOU'

for letra in texto:
    if letra.upper() in vogais:
        print(letra, end='')
else:
    print()
    print('final do laço')

    for numero in range(0, 51, 5):
        print(numero, end='-')