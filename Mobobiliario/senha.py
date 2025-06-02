class Senha:
    correto =0
    usuario=0
    note=0
    def __init__(self, nome, telefone, senha):
        self.nome = nome
        self.telefone = telefone
        self.senha = senha
        if self.senha == '123' and self.telefone == 934436650:
            Senha.correto=True
            Senha.note='correto'
        else:
            Senha.correto = False
            Senha.note = 'Senha Incorreta!'
        Senha.usuario +=1

    @classmethod
    def Verificador_de_senha(cls):
        if cls.correto:
            return True
        else:
            return False

    @classmethod
    def soma(cls ,n,m):
        if cls.correto:
            resultado =int( n+m)
            return resultado
        else:
            return Senha.note

