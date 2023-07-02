menu = """
[d] Depositar
[s] Sacar
[e] Extrato
[q] Sair

=>"""

saldo = 0
limite = 500
extrato = ''
numero_saques = 0
LIMITE_SAQUES = 3

while True:
    opcao = input(menu)

    if opcao == 'd':
        deposito = float(input('Digite o valor do déposito: '))
        if deposito < 0:
            print('Valor invalido')
        else:
            saldo += deposito
            extrato += f'Deposito R$ {deposito:.2f}\n'

    if opcao == 's':
        valor = float(input('Informe o valor do saque: '))

        excedeu_saldo = valor > saldo
        excedeu_limite = valor > limite
        excedeu_saque = numero_saques >= LIMITE_SAQUES

        if excedeu_saldo:
            print('Saldo insuficiente')
        elif excedeu_limite:
            print('Valor excedido')
        elif excedeu_saque:
            print('Numero maximo de saques excedido')

        elif valor > 0:
            saldo -= valor
            extrato += f'Saque R${valor:.2f}\n'
            numero_saques += 1

        else:
            print('Valor invalido')

    elif opcao == 'e':
        print('\n=============== EXTRATO ===============')
        print('Não foram realizadas operaçoes.' if not extrato else extrato)
        print(f'\nSaldo: R$ {saldo:.2f}')
        print('===========================================')

    elif opcao == 'q':
        break

else:
    print('Operação invalida, selecione novamente')





