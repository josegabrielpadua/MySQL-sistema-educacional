CREATE DEFINER=`root`@`localhost` PROCEDURE `get_alunos_cursos`()
BEGIN
    SELECT a.nome, a.email, a.data_nascimento, n.nota, n.situacao, c.nome AS curso
    FROM Alunos AS a
    LEFT JOIN Notas AS n ON n.aluno_id = a.id
    LEFT JOIN Cursos AS c ON n.curso_id = c.id;
END