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
	(2, 'Memórias Póstumas de Brás Cubas', 1881, 1),
	(3, 'A hora da estrela', 1977, 2),
	(4, 'O sonho de uma noite de verão', 1600, 4),		
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


--SELECT * FROM Emprestimo as e INNER JOIN Leitor as l
--ON e.id_Livro = l.id_Leitor;

--SELECT * FROM Autor as a LEFT JOIN Livro as li
--ON a.id_Autor = id_Livro

-- SELECT * FROM Leitor as le RIGHT JOIN Livro as li
-- ON le.id_Leitor = li.id_Autor;

--SELECT * FROM Leitor as le FULL JOIN Emprestimo as em
--ON le.id_Leitor = em.id_Emprestimo;

--SELECT * FROM Leitor as le CROSS JOIN Emprestimo as em



SELECT COUNT(*) AS QntLeitore
FROM Leitor;

SELECT * FROM Emprestimo;

-- COUNT + GROUP BY
-- (Função agragada precisa do GROUP BY para mais atributos)
SELECT l.nome, COUNT(e.id_emprestimo) AS QtdEmprestimo
FROM Emprestimo e
JOIN Leitor l ON l.id_Leitor = e.id_Leitor
GROUP BY l.nome

-- MIN / MAX
SELECT ano FROM Livro

SELECT MIN(ano) as MenorAno FROM Livro;
SELECT MAX(ano) as MaxAno FROM Livro;


-- FUNÇÕES DE TEXTO
-- Retorna Quantidade de caracteres (Incluindo espaços)
SELECT LEN('Kessia') AS TmnString;
SELECT nome, LEN(nome) FROM Autor; 


-- UPER (MAIUSCULO) / LOWER (minusculo)
SELECT UPPER(nome) FROM Leitor;
SELECT LOWER(Nome) FROM Leitor;

--LEFT (Esquerda) RIGHT(Direita)
SELECT * FROM Livro

SELECT LEFT(Titulo, 5) as Primeiro5 FROM Livro;
SELECT RIGHT(Titulo, 5) as Ultimos5 FROM Livro;

-- REPLACE
-- Trocar caracteres

-- (Nome do atibuto, valorInicial, valorFinal)
SELECT REPLACE(Titulo, 'Harry', 'Hermione');

-- CHARINDEX
-- Localiza a posição de alguma palavra (Considera somente a primeira)
SELECT Titulo, CHARINDEX('de', Titulo) as PosiçãoTexto 
FROM Livro;

-- CONCAT
-- Concatena textos(De um atributo com o outro)
-- SELECT e.id_Emprestimo, le.nome, li.titulo

SELECT CONCAT('Empréstimo ', e.id_Emprestimo, 'Leitor: ', le.nome, ' - Livro: ', li.titulo)
FROM Emprestimo e
JOIN Leitor le ON le.id_Leitor = e.id_Leitor
JOIN Livro li ON li.id_Autor = e.id_Emprestimo;

-- SUBSTRING
-- Mostra o texto conforme o tamanho passado
SELECT SUBSTRING()



-- GETDATE 
-- dia e horario atual
SELECT GETDATE();

SELECT GETUTCDATE();

SELECT SYSDATETIMEOFFSET()
AT TIME ZONE 'E. South America Standard Time';



