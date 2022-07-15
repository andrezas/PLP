import Database
import Utils
import Chat
import System.Exit
import Cliente
import Funcionario

main = do
    dados <- Database.connect
    let codAtual = (Database.funcionarioID dados) + 1
    let funcionario = Funcionario codAtual "Teste" "admin" 763.0
    let funcionarios = Database.funcionarios dados
    Database.entityToFile funcionario "funcionario.txt" "funcId.txt"
    let newDB = dados {Database.funcionarios = funcionarios ++ [funcionario], Database.funcionarioID = codAtual}
    print (newDB)
    print( Database.funcionarios newDB)