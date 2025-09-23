---------------------------------------------------------------------------
--
-- Situa��o 4 � Cadastro de Funcion�rios
--
---------------------------------------------------------------------------

---------------------------------------------------------------------------

-- Tarefa 1: Criar a tabela Funcionarios com colunas IdFunc, Nome, Cargo e Salario.

---------------------------------------------------------------------------
CREATE DATABASE Funcionario;
USE Funcionario;

CREATE TABLE Funcionario (
IdFunc INT PRIMARY KEY,
Nome NVARCHAR(100),
Cargo NVARCHAR(100),
Salario INT
);

---------------------------------------------------------------------------

-- Tarefa 2: Inserir pelo menos 5 funcion�rios em cargos diferentes.

---------------------------------------------------------------------------
INSERT INTO Funcionario (IdFunc, Nome, Cargo, Salario)
VALUES
( 1, 'Joao Pedro', 'Dev jr', 2500),
( 2, 'Sergio Rodriguez', 'Dev Pleno', 5400),
( 3, 'Paula Ribeiro', 'Supervisora', 4200),
( 4, 'Maria Millena', 'Diretora adm', 4100),
( 5, 'Mario Jr', 'Contador', 3200)

---------------------------------------------------------------------------

-- Tarefa 3: Consultar:

---------------------------------------------------------------------------
-- Todos os funcion�rios com sal�rio acima de R$ 3.000.
SELECT * FROM Funcionario
WHERE Salario >= 3000

-- Os funcion�rios que ocupam um cargo espec�fico.
SELECT * FROM Funcionario
WHERE Cargo = 'Dev Pleno'

-- Nome e cargo de todos os funcion�rios.
SELECT Nome, Cargo FROM Funcionario
