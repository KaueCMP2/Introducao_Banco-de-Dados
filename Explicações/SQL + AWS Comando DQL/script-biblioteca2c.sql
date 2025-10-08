CREATE DATABASE BIBLIOTECA2;
GO

USE BIBLIOTECA2;
GO

CREATE TABLE Autor (
	id_Autor INT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL
	);
GO

CREATE TABLE Livro (
	id_Livro INT PRIMARY KEY,
	titulo VARCHAR(150) NOT NULL,
	ano INT,
	id_Autor INT NOT NULL,
	CONSTRAINT fk_livro_autor FOREIGN KEY (id_Autor) REFERENCES Autor(id_Autor) ON DELETE CASCADE
	);
GO

CREATE TABLE Leitor (
	id_Leitor INT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	email VARCHAR (120) UNIQUE
	);
GO

CREATE TABLE Emprestimo (
	id_Emprestimo INT PRIMARY KEY,
	id_Livro INT NOT NULL,
	id_Leitor INT NOT NULL,
	data_emprestimo DATE NOT NULL, 
	data_devolucao DATE,
	CONSTRAINT fk_empr_livro FOREIGN KEY (id_Livro) REFERENCES Livro(id_Livro) ON DELETE CASCADE,
	CONSTRAINT fk_empr_leitor FOREIGN KEY (id_Leitor) REFERENCES Leitor(id_Leitor) ON DELETE CASCADE
	);
GO

INSERT INTO Autor VALUES 
  (1,'Machado de Assis'),
  (2,'Clarice Lispector'),
  (3,'J. K. Rowling'),
  (4,'Shakespeare');
GO

INSERT INTO Livro VALUES 
	(1, 'Dom Casmurro', 1899, 1),
	(2, 'Mem�rias P�stumas de Br�s Cubas', 1881, 1),
	(3, 'A hora da estrela', 1977, 2),
	(4, 'O sonho de uma noite de ver�o', 1600, 4),		
	(5, 'Harry Potter e o calice de fogo', 2000, 3);
GO

INSERT INTO Leitor VALUES
	(1, 'Thiago Oliveira' , 'thiago@gmail.com'),
	(2, 'Caique' , 'caique@gmail.com'),
	(3, 'Odirlei' , 'odi@gmail.com' ),
	(4, 'Kessia', 'kessia@gmail.com');
GO

INSERT INTO Emprestimo VALUES --id_emprestimo, id_livro, id_leitor, data_empr, data_dev
	(1, 5, 1, '2025-09-02', '2025-09-09'), -- Thiago pegou harry potter
	(2, 4, 4, '2025-08-27', '2025-09-05'), -- kessia pegou o sonho de uma noite
	(3, 1, 2, '2025-05-01', '2025-06-10'); --caique pegou Dom casmurro
GO


-- COUNT: Contar o total de registros
SELECT * FROM Leitor;

SELECT COUNT(*) AS QntLeitore
FROM Leitor;

SELECT * FROM Emprestimo;

-- COUNT: Contar o total de registros

SELECT * FROM Leitor;

SELECT COUNT(*) AS QtdLeitores
FROM Leitor;

SELECT * FROM Emprestimo;

-- COUNT + GROUP BY 
-- (fun��o agregada precisa do GROUP BY para mais atributos)

SELECT l.nome, COUNT(e.id_emprestimo) AS QtdEmprestimo
FROM Emprestimo e
JOIN Leitor l ON l.id_Leitor = e.id_Leitor
GROUP BY l.nome


-- MIN / MAX
SELECT Ano FROM Livro;

SELECT MIN(Ano) AS MenorAno FROM Livro;
SELECT MAX(Ano) AS MaiorAno FROM Livro;

-- FUN��ES DE TEXTO

-- LEN
-- Retorna qtde de caracteres (incluindo espa�os)
SELECT LEN('K�ssia') AS TamanhoString;
SELECT nome, LEN(nome) FROM Autor;

-- UPPER (mai�sculo) / LOWER (min�sculo)
SELECT UPPER(nome) FROM Leitor;
SELECT LOWER(email) FROM Leitor;

-- LEFT(esquerda) / RIGHT(direita)
-- Pega as letras a esquerda e direita
SELECT * FROM Livro;

SELECT LEFT(titulo, 5) AS Primeiros5 FROM Livro;
SELECT RIGHT(titulo, 5) AS Ultimos5 FROM Livro;

-- REPLACE
-- Trocar caracteres
SELECT * FROM Livro;

-- REPLACE(nome_atributo, valorinicial, valorfinal)
SELECT REPLACE(titulo, 'Harry', 'Hermione')
FROM Livro;

-- CHARINDEX
-- Localizar a posi��o de alguma palavra

SELECT titulo, CHARINDEX('uma', titulo) AS PosicaoTexto
FROM Livro;

-- CONCAT:
-- Concatenar textos
-- SELECT e.id_Emprestimo, le.nome, li.titulo

SELECT CONCAT('Empr�stimo ', e.id_Emprestimo, 
' - Leitor: ', le.nome, ' - Livro: ', li.titulo)
FROM Emprestimo e
JOIN Leitor le ON le.id_Leitor = e.id_Leitor
JOIN Livro li ON li.id_Livro = e.id_Livro


-- SUBSTRING 
-- Mostra o texto conforme o tamanho passado
SELECT SUBSTRING(titulo, 1, 10)
FROM Livro;

-- RTRIM(direita) / LTRIM(esquerda) / TRIM (dos dois lados)
SELECT Nome, RTRIM(nome), LTRIM(nome), TRIM(nome)
FROM Leitor;

-- Fun��es de Data e Hora

-- GETDATE
-- dia e hor�rio atual
-- DA INSTANCIA ONDE EST� SENDO EXECUTADA
SELECT GETDATE();

SELECT SYSDATETIMEOFFSET() 
AT TIME ZONE 'E. South America Standard Time';	

-- DATEADD:
-- Adiciona um tempo a ,aos demtro de uma data
-- YEAR: ANO, MONTH: MES, DAY: DIA, WEEK: SEMANA
SELECT id_Emprestimo, data_emprestimo,
DATEADD(DAY, 7, data_emprestimo) AS PrevisaoDevolucao
FROM Emprestimo

-- DATEDIFF: Difere�a entre datas 
SELECT id_emprestimo, data_emprestimo, data_devolucao,
DATEDIFF(DAY, data_emprestimo, ISNULL(data_devolucao, GETDATE()))
AS DiasComLivro
FROM EMprestimo;
-- Se data devolu��o estiver vazio ele acrescenta o 
-- GATE DATE para inserir a data atual
-- e comparar com a data emprestimo

-- FORMAT: FORMATAR DATAS 
SELECT * FROM Emprestimo;

SELECT 
FORMAT(data_emprestimo, 'dd/MM/yyyy') AS Emprestimo,
FORMAT(data_devolucao, 'dd/MM/yy') AS Devolucao
FROM Emprestimo;


-- Extrair ano, mes e dia de uma data:
SELECT data_emprestimo,
YEAR(data_emprestimo) AS Ano,
MONTH(data_emprestimo) AS Mes,
DAY(data_emprestimo) AS Dia,
FROM Emprestimo;

SET LANGUAGE Portuguese;

-- DATEPART/ DATENAME
SELECT  DATEPART(YEAR, data_emprestimo) AS Ano,
		DATEPART(WEEKDAY, data_emprestimo) AS DiaSemana,
		DATENAME(WEEKDAY, data_Emprestimo) AS NomeDiaSemana,
		DATENAME(MONTH, data_emprestimo) AS NomeMes
FROM Emprestimo;


-- OPERADORES DE COMPARA��O

-- (Igualdade) =
SELECT titulo, ano
FROM Livro
WHERE ano = 2000;

-- (Diferente) NOT LIKE ou (!= ou <>, quando forem valores matematicos)
SELECT nome, Email
FROM Leitor
WHERE email NOT LIKE 'kes%'


-- (Maior que) >
SELECT Titulo, ano
FROM Livro
WHERE ano > 1900;

-- (Menor que) < 
SELECT Titulo, ano
FROM Livro
WHERE ano < 1900


-- (Maior ou Igual) >= 
SELECT id_emprestimo, data_emprestimo
FROM Emprestimo
WHERE data_emprestimo >= '2025-09-01'

-- (Menor ou igual) <=
SELECT id_emprestimo,data_emprestimo
FROM Emprestimo
WHERE data_emprestimo <= '2025-08-31'


-- OPERADORES LOGICOS 

-- AND (E)
SELECT emprestimo.idemprestimo, Leitor.nome,
Emprestimo.data_emprestimo, Emprestimo.data_devolucao
FROM Emprestimo
JOIN Leitor ON leitor.id_Leitor = Emprestimo.id_Leitor
WHERE MONTH(Emprestimo.data_emprestimo) = 9
AND YEAR(Emprestimo.data_emprestimo) = 2025
-- UMA E OUTRA PRECISAM SER VERDADEIRAS.
-- DUAS CONDICOES PRECISAM SER VERDADEIRAS

-- OR (Ou)
SELECT l.Titulo, l.ano, a.nome
FROM Livro l 
JOIN Autor a ON a.id_Autor = l.id_Autor
WHERE a.nome = 'Machado de Assis'
OR a.nome = 'Clarice Lispector'
-- UMA OU OUTRA PRECISASM SER VERDADEIRAS PARA RETORNAREM O VALOR

-- NOT (Nega��o)
SELECT l.titulo, l.ano, a.nome 
FROM Livro l
JOIN Autor a ON a.id_Autor = l.id_autor
WHERE NOT a.nome = 'Shakespeare'

-- OPERADORES ESPECIAIS

-- BETWEEN (Entre)
SELECT titulo, ano 
FROM Livro 
WHERE ano BETWEEN 1800 AND 2000

-- IN (Verifica uma lista de valores)
SELECT * FROM Autor
WHERE nome IN ('Machado de Assis', 'Shakespeare');

-- LIKE 
SELECT titulo 
FROM Livro
WHERE titulo LIKE '%O';
-- % Antes da letra -- existe texto antes da letra
-- % Depois da letra -- Existe texto depois da letra
-- % antes e depois da letra -- existe texto antes e depois da letra

-- IS NULL (Registros vazios)
-- Retorna registros Vazios
SELECT id_emprestimo, id_Livro, data_emprestimo
FROM Emprestimo
WHERE data_devolucao IS NULL;

-- IS NOT NULL 
-- Registros que nao sao vazios
SELECT id_emprestimo, id_Livro, data_emprestimo 
FROM Emprestimo
WHERE data_devolucao IS NOT NULL;
