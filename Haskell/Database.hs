module Database where

import qualified System.IO.Strict as SIO

import Utils
import Cliente
import Funcionario
import TypeClasses

-- type Interaction = (DB -> Int -> IO ())

data Database = Database {
  clientes :: [Cliente],
  funcionarios :: [Funcionario],
  clienteID :: Int,
  funcionarioID :: Int
} deriving (Show)

listOfStringToListOfClientes l = map read l :: [Cliente]
listOfStringToListOfFuncionarios l = map read l :: [Funcionario]
stringToInt str = read str :: Int

addToFile :: Stringfy a => FilePath -> a -> IO ()
addToFile path content = appendFile ("./db/" ++ path) (toString content ++ "\n")

writeToFile :: Stringfy a => FilePath -> [a] -> IO ()
writeToFile path content = writeFile ("./db/" ++ path) (listOfAnythingToString content)

writeIdToFile path id = writeFile ("./db/" ++ path) (show id)

readFile' path = SIO.readFile $ "./db/" ++ path

entityToFile :: (Entity a, Stringfy a) => a -> String -> String -> IO ()
entityToFile a entityFile idFile = do
  addToFile entityFile a
  writeIdToFile idFile (entityId a)
  return ()

connect :: IO Database
connect = do
  clientesContent <- readFile' "cliente.txt"
  funcionariosContent <- readFile' "funcionario.txt"

  currentIdClienteContent <- readFile' "cliId.txt"
  currentIdFuncionarioContent <- readFile' "funcId.txt"

  let clientes = listOfStringToListOfClientes $ splitForFile $ clientesContent
  let funcionarios = listOfStringToListOfFuncionarios $ splitForFile $ funcionariosContent

  let currentIdCliente = stringToInt currentIdClienteContent
  let currentIdFuncionario = stringToInt currentIdFuncionarioContent

  return (Database clientes currentIdCliente funcionarios currentIdFuncionario) 