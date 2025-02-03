DELIMITER //

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