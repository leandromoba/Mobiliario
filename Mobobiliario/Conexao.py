import  mysql.connector

class Conect:
    def __init__(self):
        try:
            self.conexao = mysql.connector.connect(
                host="localhost",
                user="root",
                password="",
                database="CompraVenda"
            )
            self.cursor= self.conexao.cursor()
            if self.conexao.is_connected():
                print("Conexao bem sussedida!")
        except mysql.connector.Error as erro:
            print(f"Erro ao conectar com a base de dados: {erro}")

    ### Funcao para inserir dados na tabela proprietario
    def InserirTableaProprietario(self, nome, Nacionalidade, NuBI, Genero, Tel1, Tel2, Email):
        try:
            sql = """INSERT INTO Proprietario
                     (NomeProprie, Nacionalidade, NuBI, Genero, Tel1, Tel2, Email)
                     VALUES (%s, %s, %s, %s, %s, %s, %s)"""
            valores = (nome, Nacionalidade if Nacionalidade else 'Angola', NuBI, Genero, Tel1, Tel2 if Tel2 else '---------------', Email if Email else '---------------')
            self.cursor.execute(sql, valores)
            self.conexao.commit()
            print(f"Dados inserido com susseco na Tabela Proprietario!")
        except mysql.connector.Error as erro:
            print(f"Erro ao inserir os dados: {erro}")

    ### Funcao para inserir dados na tabela Terreno
    def InserirTabelaTerreno(self, Tamanho, Preco, Descricao, IdProprie):
        try:
            sql= """INSERT INTO Terreno
                    (Tamanho, Preco, Descricao, IdProprie)
                    VALUES (%s, %s, %s, %s)"""
            valores = (Tamanho, Preco, Descricao if Descricao else '--------------', IdProprie)
            self.cursor.execute(sql, valores)
            self.conexao.commit()
            print("Dados inseridos com susseco Tabela Proprietario!")
        except mysql.connector.Error as er:
            print(f"Erro ao inserir dados na tabela Terreno: {er}")

    ### Funcao para inserir dados na tabela Endereco
    def InserirTabelaEndero(self, Pais, Provincia, Municipio, Bairro, Descri, IdTerreno):
        try:
            sql = """INSERT INTO Endereco
                     (Pais, Provincia, Municipio, Bairro, Descri, IdTerreno)
                     VALUES (%s, %s, %s, %s, %s, %s)"""
            valores =(Pais if Pais else 'Angola', Provincia, Municipio, Bairro, Descri if Descri else '---------------', IdTerreno)
            self.cursor.execute(sql, valores)
            self.conexao.commit()
            print("Dados inserido com sucesso na tabela Endereço!")
        except mysql.connector.Error as er:
            print(f"Erro ao inserir dados na tabela Endereco: {er}")

    ### Funcao para inserir dados na tabela Cliente
    def InserirTabelaCliente(self, NomeCliente, Nacionalidade, NuBI, Genero, Tel1, Tel2, Email):
        try:
            sql = """INSERT INTO Cliente
                    (NomeCliente, Nacionalidade, NuBI, Genero, Tel1, Tel2, Email)
                    VALUES (%s, %s, %s, %s, %s, %s, %s)"""
            valores = (NomeCliente, Nacionalidade if Nacionalidade else 'Angolano/a', NuBI, Genero, Tel1, Tel2 if Tel2 else '---------------', Email if Email else '---------------')

            self.cursor.execute(sql, valores)
            self.conexao.commit()
            print("Daos inserido com sucesso na tabela Cliente!")
        except mysql.connector.Error as er:
            print(f"Erro ao inserir dados na tabela Cliente: {er}")

    ### Funcao para inserir dados na tabela Venda
    def InserirTabelaVenda(self, ValorPago, Intereces, Descricao, IdProprie, IdTerreno, IdCliente):
        try:
            sql = """INSERT INTO Venda
                    (ValorPago, Intereces, Descricao, IdProprie, IdTerreno, IdCliente)
                    VALUES (%s, %s, %s, %s, %s, %s)"""
            valores = (ValorPago, Intereces if Intereces else '--------------', Descricao if Descricao else '---------------', IdProprie, IdTerreno, IdCliente)

            self.cursor.execute(sql, valores)
            self.conexao.commit()
            print("Dados inserido com sucesso na tabela Venda!")
        except mysql.connector.Error as er:
            print(f"Erro ao inserir dados na tabela Venda: {er}")

    def Consultar(self):
        try:
            sql = "SELECT * FROM Venda"
            self.cursor.execute(sql)
            resultados = self.cursor.fetchall()
            return resultados
        except mysql.connector.Error as e:
            print(f"Tentativa errada: {e}")
            return None

    def fechar_conexao(self):
        # Fechando o cursor e a conexão
        self.cursor.close()
        self.conexao.close()
        print("Conexão fechada.")


        ################################


bd = Conect()
bd.Consultar()
