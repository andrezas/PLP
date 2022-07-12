module Cliente where

type ClienteID = Int
type Nome = String
type Contato = String

data Cliente = Cliente
  { cod :: Id,
    nome :: Nome,
    contato :: Contato
  }
  deriving (Read, Show)


criarCliente :: Id -> Nome -> Contato -> IO()
criarCliente cod nome contato = do
  let cliente = Cliente {cod = cod, nome = nome, contato = contato}
  file <- appendFile "clientes.txt" ("\n" ++ show cliente)
  putStrLn "Cliente cadastrado com sucesso!"


main :: IO ()
main = do
  nome <- getLine
  contato <- getLine
  criarCliente 1 nome contato