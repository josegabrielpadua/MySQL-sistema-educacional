-- Inserir 10.000 alunos com nomes aleatórios
INSERT INTO Alunos (nome, email, data_nascimento)
SELECT 
    CONCAT('Aluno', (@row := @row + 1)), 
    CONCAT('aluno', @row, '@email.com'), 
    DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 10000) DAY)
FROM (SELECT @row := 0) r, 
     (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
     (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2
LIMIT 10000;

-- Inserir 500 cursos com nomes fictícios
INSERT INTO Cursos (nome, descricao)
SELECT 
    CONCAT('Curso ', @curso := @curso + 1), 
    'Descrição do curso'
FROM (SELECT @curso := 0) r, 
     (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
     (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2
LIMIT 500;

-- Inserir 200 professores com especialidades aleatórias
INSERT INTO Professores (nome, especialidade)
SELECT 
    CONCAT('Professor ', @prof := @prof + 1), 
    CONCAT('Especialidade ', FLOOR(RAND() * 10))
FROM (SELECT @prof := 0) r, 
     (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
     (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) t2
LIMIT 200;

-- Inserir 50.000 matrículas aleatórias
INSERT INTO Matriculas (aluno_id, curso_id, data_matricula)
SELECT 
    (SELECT id FROM Alunos ORDER BY RAND() LIMIT 1), -- ID existente
    (SELECT id FROM Cursos ORDER BY RAND() LIMIT 1), -- ID existente
    NOW()
FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
     (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2
LIMIT 50000;

-- Inserir 100.000 notas aleatórias
INSERT INTO Notas (aluno_id, curso_id, nota)
SELECT 
    (SELECT id FROM Alunos ORDER BY RAND() LIMIT 1), -- ID existente
    (SELECT id FROM Cursos ORDER BY RAND() LIMIT 1), -- ID existente
    ROUND(RAND() * 10, 2) -- Nota entre 0 e 10
FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
     (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2
LIMIT 100000;