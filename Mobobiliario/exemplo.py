import mysql.connector

class Conect:
    def __init__(self):
        # Inicializando a conexão com o banco de dados
        try:
            self.conexao = mysql.connector.connect(
                host="localhost",
                user="root",
                password="",
                database="CompraVenda"
            )
            self.cursor = self.conexao.cursor()
            if self.conexao.is_connected():
                print("Conexão com o MySQL realizada com sucesso!")
        except mysql.connector.Error as err:
            print(f"Erro na conexão: {err}")

    def InserirDados(self, nome, Nacionalidade, NuBI, Genero, Tel1, Tel2, Email):
        try:
            # Query para inserir dados na tabela Proprietario
            sql = """INSERT INTO Proprietario 
                     (NomeProprie, Nacionalidade, NuBI, Genero, Tel1, Tel2, Email, DataVendedor) 
                     VALUES (%s, %s, %s, %s, %s, %s, %s, DEFAULT)"""
            valores = (nome, Nacionalidade if Nacionalidade else 'Angola', NuBI, Genero, Tel1, Tel2, Email)
            self.cursor.execute(sql, valores)
            self.conexao.commit()
            print("Dados inseridos com sucesso!")
        except mysql.connector.Error as err:
            print(f"Erro ao inserir dados: {err}")

    def fechar_conexao(self):
        # Fechando o cursor e a conexão
        self.cursor.close()
        self.conexao.close()
        print("Conexão fechada.")


# Exemplo de uso
if __name__ == "__main__":
    # Criando instância da classe
    db = Conect()

    # Capturando entradas do usuário com validação
    try:
        nome = input("Insira o nome (máx. 40 caracteres): ").strip()[:40]
        if not nome:
            raise ValueError("Nome é obrigatório!")

        Nacionalidade = input("Insira a nacionalidade (deixe em branco para 'Angola'): ").strip()[:40]

        NuBI = input("Insira o Número do BI (máx. 40 caracteres): ").strip()[:40]
        if not NuBI:
            raise ValueError("Número do BI é obrigatório!")

        Genero = input("Insira o gênero (M/F): ").strip().upper()
        if Genero not in ['M', 'F']:
            raise ValueError("Gênero deve ser 'M' ou 'F'!")

        Tel1 = input("Insira o Telefone 1 (máx. 15 caracteres): ").strip()[:15]
        if not Tel1:
            raise ValueError("Telefone 1 é obrigatório!")

        Tel2 = input("Insira o Telefone 2 (opcional, máx. 15 caracteres): ").strip()[:15] or None

        Email = input("Insira o Email (opcional, máx. 40 caracteres): ").strip()[:40] or None

        # Inserindo dados
        db.InserirDados(nome, Nacionalidade, NuBI, Genero, Tel1, Tel2, Email)

        # Fechando conexão
        db.fechar_conexao()

    except ValueError as ve:
        print(f"Erro de validação: {ve}")
    except Exception as e:
        print(f"Erro inesperado: {e}")