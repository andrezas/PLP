module Servico where

import Cliente
import Mecanico

type ServicoID = Int
type Cliente = Cliente
type ModeloVeiculo = String
type PlacaVeiculo = String
type Mecanico = Mecanico

data Servico = Servico { 
    cod :: ServicoID,
    cliente :: Cliente,
    modelo :: ModeloVeiculo,
    placa :: PlacaVeiculo,
    codMecanico :: Mecanico
  }
  deriving (Read, Show)


criarServico :: Id -> Cliente -> ModeloVeiculo -> PlacaVeiculo -> Mecanico -> IO()
criarServico id client modelo placa codMecanico = do
  let servico = Servico {cod = id, cliente = client, modelo = modelo, placa = placa, codMecanico = codMecanico}
  file <- appendFile "db/servicos.txt" ("\n" ++ show servico)
  putStrLn "Serviço cadastrado com sucesso!"