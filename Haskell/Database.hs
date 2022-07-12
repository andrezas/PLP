module Database where

import qualified System.IO.Strict as SIO

import Cliente
import Funcionario
import TypeClasses

-- type Interaction = (DB -> Int -> IO ())

data Database = Database {
  funcionarios :: [Funcionario],
  clientes :: [Cliente],
  currentIdFuncionario :: Int,
  currentIdCliente :: Int
} deriving (Show)