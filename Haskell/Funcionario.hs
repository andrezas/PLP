module Funcionario where

type FuncionarioID = Int
type Nome = String
type Funcao = Int
type Salario = Float

data Funcionario = Admin
  { cod :: FuncionarioID,
    nome :: Nome,
    funcao :: Funcao,
    remuneracao :: Salario 
  }
  deriving (Read, Show)


criarFunc :: Id -> Nome -> Funcao -> Salario -> IO()
criarFunc cod nome funcao salario = do
  let funcionario = Funcionario {cod = cod, nome = nome, funcao = funcao, remuneracao = salario}
  file <- appendFile "db/funcionarios.txt" ("\n" ++ show funcionario)
  putStrLn "Funcionário cadastrado com sucesso!"