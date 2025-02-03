USE Educacional;

-- Consulta Básica que Seleciona tudo da tabela "Alunos" do Database "Educacional" 
SELECT * FROM Alunos;

-- Consulta Básica que Seleciona tudo da tabela "Alunos" do Database "Educacional" só que ordenando por data, trazendo datas mais antigas primeiro. 
SELECT * FROM Alunos
ORDER BY data_nascimento;

-- Consulta Básica que Seleciona tudo da tabela "Alunos" do Database "Educacional" só que ordenando por data, trazendo datas mais recentes primeiro
SELECT * FROM Alunos
ORDER BY data_nascimento DESC;


-- Atualizando nome e email da tabela "Aluno" do Database "Educacional" onde o id seja igual a 3
UPDATE Alunos
SET nome = 'Alfredo Silva', email = 'alfredosilva@gmail.com'
WHERE id = 3;

-- Consulta Básica que Seleciona somente um aluno em específico do Database "Educacional"
SELECT * FROM Alunos WHERE nome = 'Alfredo Silva';


-- Delete Básico de somente um aluno em específico do Database "Educacional" onde o id seja igual a 4
DELETE FROM Matriculas WHERE id = 4;

SELECT * FROM Matriculas
LIMIT 10;

SELECT * FROM Matriculas
LIMIT 10 OFFSET 3;

SELECT MIN(nota) as MenorNota FROM Notas;

SELECT MAX(nota) as MaiorNota FROM Notas;

SELECT AVG(nota) as MédiaNota FROM Notas;

SELECT COUNT(nota) as QuantasNotas FROM Notas;

SELECT SUM(nota) as SomaNota FROM Notas;

SELECT * FROM Professores
WHERE especialidade IN ('Especialidade 8', 'Especialidade 9');

SELECT * FROM Professores
WHERE especialidade NOT IN ('Especialidade 8', 'Especialidade 9');

SELECT * FROM Notas
WHERE nota BETWEEN 5 and 7;

SELECT ALL * FROM Notas
WHERE nota BETWEEN 5 and 7;

SELECT a.nome, a.email, a.data_nascimento, n.nota
FROM Notas as n
RIGHT JOIN Alunos as a ON n.aluno_id = a.id;

SELECT a.nome, a.email, a.data_nascimento, n.nota, n.situacao, c.nome
FROM Notas as n
RIGHT JOIN Alunos as a ON n.aluno_id = a.id
JOIN Cursos as c ON n.curso_id = c.id;

-- Mesma função de cima porém é uma procedure
CALL get_alunos_cursos();

-- Utilizando a função que criei para calcular a nota do aluno 
SELECT calcula_nota_aluno(3);


-- Principais Consultas

-- Alunos Matriculados em um Curso Específico

SELECT a.nome, c.nome AS curso
FROM Alunos AS a
JOIN Matriculas AS m ON a.id = m.aluno_id
JOIN Cursos AS c ON m.curso_id = c.id
WHERE c.nome = 'Curso 1';


-- Média das Notas por Curso:

SELECT c.nome AS curso, AVG(n.nota) AS media_notas
FROM Cursos AS c
LEFT JOIN Notas AS n ON c.id = n.curso_id
GROUP BY c.nome;



