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