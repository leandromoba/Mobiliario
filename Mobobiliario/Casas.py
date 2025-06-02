from senha import Senha

class Codigo:
    def Passwod(self):
        nome=str(input("Digite o teu Nome "))
        numero= int(input("Digite o numero "))
        senha= str(input("Digite a senha "))
        cod=Senha(nome, numero, senha)
sen=Codigo()
sen.Passwod()