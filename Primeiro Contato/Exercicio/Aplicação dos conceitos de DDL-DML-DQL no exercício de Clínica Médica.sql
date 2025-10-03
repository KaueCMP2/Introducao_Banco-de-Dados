CREATE DATABASE Exercicios;
GO

USE Exercicios;
GO

----------------------------------------------------------------------------

-- 1. Inserir dados na tabela Paciente.
-- Adicione pelo menos seis pacientes diferentes.

----------------------------------------------------------------------------

-- CRIA TABELA DO PACIENTE
CREATE TABLE Paciente(
		CPF NVARCHAR(20) PRIMARY KEY,
		Nome VARCHAR(40),
		Telefone NVARCHAR(30),
		Numero_Plano INT,
		NomePlano VARCHAR(20),
		TipoVarchar VARCHAR(10)
);
GO

-- INSERE OS VALORES NA TABELA DO PACIENTE
INSERT INTO Paciente (CPF, Nome, Telefone, Numero_Plano, NomePlano, TipoVarchar)
VALUES
('12345678901', 'Ana Silva', '11987654321', '001', 'Amil Saúde', 'Ativo'),
('23456789012', 'Carlos Pereira', '21998765432', '002', 'Unimed', 'Ativo'),
('34567890123', 'Mariana Souza', '31991234567', '003', 'Bradesco Saúde', 'Ativo'),
('45678901234', 'João Oliveira', '41992345678', '004', 'NotreDame', 'Ativo'),
('56789012345', 'Fernanda Lima', '51993456789', '005', 'SulAmérica', 'Ativo'),
('67890123456', 'Ricardo Santos', '61994567890', '006', 'Hapvida', 'Ativo');
GO


----------------------------------------------------------------------------

-- 2. Inserir dados na tabela Medico.
-- Adicione pelo menos cinco médicos com especialidades distintas.

----------------------------------------------------------------------------

-- CRIA A TABELA DO MEDICO
CREATE TABLE Medico(
CRM NVARCHAR(10) PRIMARY KEY,
Nome_Medico VARCHAR(20),
Especialidade VARCHAR(30)
);
GO

-- INSERINDO VALORES NA TABELA DO MEDICO
INSERT INTO Medico (CRM, Nome_Medico, Especialidade)
VALUES
('12345-SP', 'Dr. João Almeida', 'Cardiologia'),
('23456-RJ', 'Dra. Maria Fernandes', 'Pediatria'),
('34567-MG', 'Dr. Carlos Oliveira', 'Ortopedia'),
('45678-RS', 'Dra. Ana Souza', 'Dermatologia'),
('56789-BA', 'Dr. Pedro Lima', 'Neurologia');
GO


----------------------------------------------------------------------------

-- 3. Inserir consultas médicas.
-- Agende consultas para diferentes pacientes com diferentes médicos.

----------------------------------------------------------------------------

-- CRIANDO TABELA CONSULTAS
CREATE TABLE Consulta (
	NumeroConsulta INT PRIMARY KEY IDENTITY(100, 1), -- (valor inicial, incremento)
	DataConsulta DATE,
	HorarioConsulta TIME,
	CRM_Medico NVARCHAR(10) FOREIGN KEY REFERENCES Medico(CRM),
	CPF_Paciente NVARCHAR(20) FOREIGN KEY REFERENCES Paciente(CPF)
);
GO

-- INSERINDO VALORES NA TABELA CONSULTAS
INSERT INTO Consulta (DataConsulta, HorarioConsulta, CRM_Medico, CPF_Paciente)
VALUES
('2025-10-05', '09:00', '12345-SP', '12345678901'), -- Ana Silva com Dr. João Almeida (Cardiologia)
('2025-10-05', '10:30', '23456-RJ', '23456789012'), -- Carlos Pereira com Dra. Maria Fernandes (Pediatria)
('2025-10-06', '14:00', '34567-MG', '34567890123'), -- Mariana Souza com Dr. Carlos Oliveira (Ortopedia)
('2025-10-07', '11:15', '45678-RS', '45678901234'), -- João Oliveira com Dra. Ana Souza (Dermatologia)
('2025-10-08', '16:45', '56789-BA', '56789012345'); -- Fernanda Lima com Dr. Pedro Lima (Neurologia)
GO
----------------------------------------------------------------------------

-- 4. Listar todos os pacientes cadastrados.

----------------------------------------------------------------------------

-- LISTANDO OS PACIENTES DA TABELA PACIENTE
SELECT Nome FROM Paciente;
GO


----------------------------------------------------------------------------

-- 5. Listar todos os médicos e suas especialidades.

----------------------------------------------------------------------------

-- LISTANDO OS MEDICOS E ESPECIALIDADES
Select Nome_Medico, Especialidade FROM Medico
GO


----------------------------------------------------------------------------

-- 6. Buscar todas as consultas agendadas.
-- Exibir o número da consulta, a data, o horário, o nome do paciente e o nome do médico.

----------------------------------------------------------------------------

-- BUSCANDO TODAS AS CONSUlTAS AGENDADAS

SELECT * FROM Consulta
GO


----------------------------------------------------------------------------

-- 7. Buscar consultas de um paciente específico.
-- Filtrar as consultas de um paciente pelo CPF.

----------------------------------------------------------------------------

-- BUSCANDO CONSULTAS DE PACIENTES ESPECIFICOS
SELECT * FROM Consulta
WHERE CPF_Paciente = 12345678901;
GO


----------------------------------------------------------------------------

-- 8. Buscar consultas de um médico específico.  
-- Filtrar as consultas de um médico pelo CRM.

----------------------------------------------------------------------------

-- BUSCANDO CONSULTAS DE UM MEDICO ESPECIFICO 
SELECT * FROM Consulta
WHERE CRM_Medico = '23456-RJ';
GO


----------------------------------------------------------------------------

-- 9. Atualizar o número do plano de três pacientes.

----------------------------------------------------------------------------

UPDATE Paciente
SET NomePlano = 'PL003'
WHERE 

----------------------------------------------------------------------------

-- 10. Deletar dois pacientes do sistema.

----------------------------------------------------------------------------

----------------------------------------------------------------------------

-- 11. Inserir novos dados 
-- Cadastre mais três médicos e dois pacientes extras no sistema.

----------------------------------------------------------------------------

----------------------------------------------------------------------------

-- 12. Atualizar informações de médicos 
-- ○ Atualize a especialidade de dois médicos já cadastrados.

----------------------------------------------------------------------------


