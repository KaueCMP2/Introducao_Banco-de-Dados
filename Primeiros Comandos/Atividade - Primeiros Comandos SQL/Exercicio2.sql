--------------------------------------------------------------------------------
--
-- Tarefa 1: Criar uma tabela Jogos com colunas IdJogo, Titulo, Genero e Preco.
--
--------------------------------------------------------------------------------

-- 1 Criar uma base de dados
CREATE DATABASE Jogo;

-- 2 Cria a tabela e define os atributos 
CREATE TABLE Jogo(
IdJogo INT PRIMARY KEY,
Titulo NVARCHAR (100),
Genero NVARCHAR (100),
Pre�o INT
);

--------------------------------------------------------------------------------
--
-- Tarefa 2: Inserir pelo menos 6 jogos de g�neros diferentes.
--
--------------------------------------------------------------------------------

INSERT INTO Jogo(IdJogo,Titulo, Genero, Pre�o)
VALUES
( 1, 'Free Fire', 'Battle royale', 0),
( 2, 'Clash Royale', 'Estrategia', 0),
( 3, 'Grand Theft Auto', 'A�ao', 200),
( 4, 'Call of duty B.O.2','A�ao' , 80),
( 5, 'Need for Speed 7', 'Corrida', 90),
( 6, 'God of War 2018', 'A�ao', 70);

--------------------------------------------------------------------------------
--
-- Tarefa 3: Consultar:
--
--------------------------------------------------------------------------------

-- Todos os jogos de um g�nero espec�fico (ex: "A��o").
SELECT * FROM Jogo
WHERE Genero = 'A�ao'

-- Os jogos com pre�o acima de R$ 200 (No caso foi 80).
SELECT * FROM Jogo
WHERE Pre�o >= 80

-- Nome e pre�o de todos os jogos.
SELECT Titulo, Pre�o FROM Jogo
