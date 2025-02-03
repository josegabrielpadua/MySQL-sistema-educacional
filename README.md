# Sistema Educacional - MySQL

Este projeto demonstra minhas habilidades em SQL e desenvolvimento de banco de dados usando MySQL.  Ele simula um sistema educacional simples para gerenciar alunos, cursos, professores e notas.

## Diagrama do Modelo de Dados

![image](https://github.com/user-attachments/assets/62c720b9-07aa-46ca-b0bb-433702dc14ae)


## Funcionalidades

* Criação do banco de dados e tabelas.
* Inserção de dados de exemplo (10.000 alunos, 500 cursos, 200 professores, 50.000 matrículas e 100.000 notas).
* Consultas SQL para recuperar e manipular dados.
* Stored procedure `get_alunos_cursos` para visualizar alunos e seus cursos.
* Função `calcula_nota_aluno` para calcular a nota total de um aluno.
* Trigger `before_update_notas` para atualizar a situação da nota automaticamente.


## Consultas SQL

Aqui estão alguns exemplos de consultas SQL utilizadas neste projeto:

**1. Alunos Matriculados em um Curso Específico:**

```sql
SELECT a.nome, c.nome AS curso
FROM Alunos AS a
JOIN Matriculas AS m ON a.id = m.aluno_id
JOIN Cursos AS c ON m.curso_id = c.id
WHERE c.nome = 'Curso 1';

```

![image](https://github.com/user-attachments/assets/02aad15e-6e0a-40e8-9153-12c8cadbc911)

**1. Média das Notas por Cursos:**

```sql
SELECT c.nome AS curso, AVG(n.nota) AS media_notas
FROM Cursos AS c
LEFT JOIN Notas AS n ON c.id = n.curso_id
GROUP BY c.nome;

```

![image](https://github.com/user-attachments/assets/43f891ee-032e-4e1e-92cf-d13fa2eca205)

**Stored Procedure para visualizar alunos e seus cursos:**

```sql
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_alunos_cursos`()
BEGIN
    SELECT a.nome, a.email, a.data_nascimento, n.nota, n.situacao, c.nome AS curso
    FROM Alunos AS a
    LEFT JOIN Notas AS n ON n.aluno_id = a.id
    LEFT JOIN Cursos AS c ON n.curso_id = c.id;
END

CALL get_alunos_cursos();

```

![image](https://github.com/user-attachments/assets/569d17d5-6813-4034-8701-f385850a1eaf)

**Função para calcular a nota total de um aluno:**

```sql
DELIMITER //
CREATE FUNCTION calcula_nota_aluno(id_aluno INT) RETURNS DECIMAL(10,2) DETERMINISTIC
BEGIN
    DECLARE NotaTotal DECIMAL(10,2);
    
    SELECT COALESCE(SUM(n.nota), 0) INTO NotaTotal
    FROM Notas n
    WHERE n.aluno_id = id_aluno;
    
    RETURN NotaTotal;
END //

DELIMITER ;

SELECT calcula_nota_aluno(3) as NotaCalculada;

```

![image](https://github.com/user-attachments/assets/b360fb63-7fe6-4101-83f2-2c5e6357bd34)

**Trigger para atualizar a situação da nota automaticamente**

DELIMITER //

```sql
CREATE TRIGGER before_update_notas
BEFORE UPDATE ON Notas
FOR EACH ROW
BEGIN
    IF NEW.nota < 6 THEN 
        SET NEW.situacao = 'Nota abaixo da Média';
    ELSEIF NEW.nota > 6 THEN 
        SET NEW.situacao = 'Nota acima da Média';
    ELSE 
        SET NEW.situacao = 'Nota na Média';
    END IF;
END //

DELIMITER ;

UPDATE Notas
SET nota = 8.12
WHERE aluno_id = 14;

```

![image](https://github.com/user-attachments/assets/a19d129d-8193-40c1-a23a-e49ce43702ad)

![image](https://github.com/user-attachments/assets/77e4aa9e-336a-48df-a05f-6c24c6e3f0c6)



