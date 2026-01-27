import sqlite3

# Isso cria o arquivo sus.db na mesma pasta do seu script
conexao = sqlite3.connect('sus.db')
conexao.close()

print("Arquivo 'sus.db' criado com sucesso e está pronto para receber tabelas!")