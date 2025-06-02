# Criando instância da classe
import mysql.connector

from Conexao import Conect
#from Casas import Codigo
class Base:
    def __init__(self):
        self.db = Conect()

    # Funcao para inserir dados na tabela Proprietario
    def InserirProprietario(self):
        try:
            print("############# Funcao Para inserir dados na tabela do Proprietario #############")
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
            self.db.InserirTableaProprietario(nome, Nacionalidade, NuBI, Genero, Tel1, Tel2, Email)

        except ValueError as ve:
            print(f"Erro de validação: {ve}")
        except Exception as e:
            print(f"Erro inesperado: {e}")

    # Funcao para inserir dasdos na tabela Terreno
    def InseriTerreno(self):
        try:
            print("################## Fucao Para inserir dados na tabela Terreno #######################")
            Tamanho = str(input("Tamanho do terreno: ")).strip()
            if not Tamanho:
                raise ValueError("O tamanho do terreno é obrigatorio!")

            Preco = float(input("Digite o preco do terreno: "))
            if not Preco:
                raise ValueError("O preco é Obrigatorio!")

            Descricao = str(input("Digite a descricao do terreno: ")).strip()[:45] or None

            IdProprie =int(input("Digite o Id do proprietario: "))
            if not IdProprie:
                raise ValueError("O ID do proprietario é obrigatorio!")

            self.db.InserirTabelaTerreno(Tamanho, Preco,Descricao, IdProprie)
            self.db.fechar_conexao()
        except ValueError as ve:
            print(f"Erro de validação: {ve}")
        except Exception as e:
             print(f"Erro inesperado: {e}")

    # Funcao para inserir dados na tabela Endereco
    def InseirEndereco(self):
        try:
            print("############## Funcao Para inserir dados na tabela Endereco #################")
            Pais = str(input("Digite o nome do país (max. 40 caracteres): ")).strip()[:40] or None
            Provincia = str(input("Digite a provicia:")).strip()[:40]
            if not Provincia:
                raise  ValueError("A provicia é obrigatorio!")

            Muncipio = str(input("Digite o Municipio: ")).strip()[:40]
            if not Muncipio:
                raise ValueError("É obrigatorio Inserir o municipio!")
            Bairro= str(input(("Digite o bairro: "))).strip()[:40]
            if not Bairro:
                raise ValueError("É obrigatorio inserir Bairro!")

            Descri =str(input("Digite a descricao do terreno: ")).strip()[:40] or None
            IdTerreno = int(input("Digite do Id do terreno: "))
            if not  IdTerreno:
                raise ValueError("O id do terreno é obrigatori!")

            self.db.InserirTabelaEndero(Pais, Provincia, Muncipio, Bairro, Descri, IdTerreno)

        except mysql.connector.Error as er:
            print(f"Erro de validacao {er}")
        except Exception as ex:
            print(f"Erro inesperado {ex}")

    # Funcao para inserir dados na tabela Cliente
    def InserCliente(self):
        try:
            print("############## Funcao inserir dados na tabela Cliente ##################")
            NomeCliente = str(input("Digite o nome do cliente: ")).strip()[:40]
            if not NomeCliente:
                raise ValueError("O Nome do cliente é obrigatorio!")

            Nacionalidade = input("Insira a nacionalidade: ").strip()[:40] or None

            NuBI = input("Insira o Número do BI: ").strip()[:40]
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

            self.db.InserirTabelaCliente(NomeCliente, Nacionalidade, NuBI, Genero, Tel1, Tel2, Email)

        except mysql.connector.Error as er:
            print(f"Erro ao inserir dados na tabela Cliente: {er}")
        except Exception as ex:
            print(f"Erro inesperado: {ex}")
    # Funcao para inserir dados na tabela venda
    def InserirVenda(self):
        try:
            print("############## Funcao inserir dados na tabela Venda ##################")
            ValorPago = float(input("Digite o Preço da venda: "))
            if not ValorPago:
                raise ValueError("O valor do Venda é obrigatorio!")

            Intereces= str(input("Digite quis são os interces: ")).strip()[:60] or None

            Descricao=str(input("Digite a descricao da venda: ")).strip()[:60] or None

            IdProprie = int(input("Digite o Id do proprietario: "))
            if not IdProprie:
                raise ValueError("O ID do proprietario!")

            IdTerreno  = int(input("Digite o Id do Terreno a ser vendido: "))
            if not IdProprie:
                raise ValueError("O ID do Terrono é obrigatorio!")

            IdCliente = int(input("Digite o Id do Cliente: "))
            if not IdProprie:
                raise ValueError("O ID do Cliente é obrigatorio!")

            self.db.InserirTabelaVenda(ValorPago, Intereces, Descricao, IdProprie, IdTerreno, IdCliente)

        except mysql.connector.Error as er:
            print(f"Erro ao inserir dados na tabela Venda: {er}")
        except Exception as ex:
            print(f"Erro inesperado: {ex}")

