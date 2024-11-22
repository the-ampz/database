-- ===================================================
-- Fun��o para calcular o consumo total de energia
-- ===================================================
CREATE OR REPLACE FUNCTION fn_calculate_total_consumption(p_id_device IN NUMBER) 
RETURN NUMBER 
IS
    v_total_consumption NUMBER := 0;
    v_device_count NUMBER := 0;
    v_consumption_count NUMBER := 0;
BEGIN
    -- Verificar se o ID do dispositivo � NULL ou inv�lido
    IF p_id_device IS NULL OR p_id_device <= 0 THEN
        RAISE_APPLICATION_ERROR(-20004, 'ID do dispositivo inv�lido fornecido.');
    END IF;

    -- Verificar se o dispositivo existe na tabela t_ampz_device
    BEGIN
        SELECT COUNT(*)
        INTO v_device_count
        FROM t_ampz_device
        WHERE id_device = p_id_device;
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20009, 'Erro ao verificar a exist�ncia do dispositivo: ' || SQLERRM);
    END;

    -- Se o dispositivo n�o existir, levantar erro informando que n�o foi encontrado
    IF v_device_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20008, 'Dispositivo n�o encontrado com o ID fornecido.');
    END IF;

    -- Somando o consumo de energia registrado na tabela t_ampz_energy_consumption
    BEGIN
        SELECT SUM(vl_consumption)
        INTO v_total_consumption
        FROM t_ampz_energy_consumption
        WHERE id_device = p_id_device;

        -- Verificar se algum registro de consumo foi encontrado
        SELECT COUNT(*)
        INTO v_consumption_count
        FROM t_ampz_energy_consumption
        WHERE id_device = p_id_device;

        IF v_consumption_count = 0 THEN
            RAISE_APPLICATION_ERROR(-20010, 'Nenhum dado de consumo encontrado para o dispositivo fornecido.');
        END IF;

        -- Se n�o houver registros de consumo encontrados, retornar 0
        IF v_total_consumption IS NULL THEN
            v_total_consumption := 0;
        END IF;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            -- Se n�o encontrar dados para o dispositivo, retornar 0
            v_total_consumption := 0;
        WHEN VALUE_ERROR THEN
            -- Se ocorrer um erro de tipo de dado, levantar exce��o
            RAISE_APPLICATION_ERROR(-20005, 'Erro de tipo de dado ao calcular o consumo de energia.');
        WHEN OTHERS THEN
            -- Caso ocorra um erro inesperado ao acessar os dados de consumo
            RAISE_APPLICATION_ERROR(-20011, 'Erro inesperado ao acessar os dados de consumo de energia: ' || SQLERRM);
    END;

    -- Retornar o consumo total de energia do dispositivo
    RETURN v_total_consumption;
EXCEPTION
    WHEN OTHERS THEN
        -- Tratar qualquer erro inesperado fora do bloco aninhado
        RAISE_APPLICATION_ERROR(-20007, 'Ocorreu um erro ao processar o consumo total: ' || SQLERRM);
END fn_calculate_total_consumption;
/


-- ===================================================
-- Bloco de Teste para a fun��o fn_calculate_total_consumption
-- ===================================================
SET SERVEROUTPUT ON;
DECLARE
    v_device_id NUMBER := 0;  -- ID do dispositivo a ser verificado
    v_total_consumption NUMBER;
BEGIN
    -- Chamar a fun��o para calcular o consumo total de energia
    v_total_consumption := fn_calculate_total_consumption(v_device_id);

    -- Exibir o consumo total de energia
    DBMS_OUTPUT.PUT_LINE('O consumo total de energia do dispositivo ID ' || v_device_id || ' �: ' || v_total_consumption || ' kWh.');
EXCEPTION
    WHEN OTHERS THEN
        -- Tratar qualquer erro inesperado
        DBMS_OUTPUT.PUT_LINE('Erro ao calcular o consumo total: ' || SQLERRM);
END;
/




-- ===================================================
-- Fun��o para validar o formato e a duplicidade do e-mail
-- ===================================================
CREATE OR REPLACE FUNCTION fn_validate_email(p_email IN VARCHAR2) 
RETURN BOOLEAN 
IS
    v_valid BOOLEAN := FALSE;
    v_email_count NUMBER;
BEGIN
    -- Verificar se o e-mail � NULL
    IF p_email IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'O e-mail n�o pode ser NULL.');
    END IF;

    -- Verificar se o formato do e-mail � v�lido utilizando express�o regular
    IF NOT REGEXP_LIKE(p_email, '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$') THEN
        RAISE_APPLICATION_ERROR(-20002, 'O formato do e-mail � inv�lido.');
    END IF;

    -- Verificar se o e-mail j� est� cadastrado na tabela t_ampz_user
    SELECT COUNT(*)
    INTO v_email_count
    FROM t_ampz_user
    WHERE ds_email = p_email;

    -- Se o e-mail j� existir, levantar erro
    IF v_email_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Este e-mail j� est� cadastrado.');
    ELSE
        v_valid := TRUE;
    END IF;

    -- Retornar TRUE se o e-mail for v�lido
    RETURN v_valid;

EXCEPTION
    WHEN OTHERS THEN
        -- Capturar qualquer erro inesperado e retornar um erro gen�rico
        RAISE_APPLICATION_ERROR(-20004, 'Ocorreu um erro ao validar o e-mail.');
END fn_validate_email;
/


-- ===================================================
-- Bloco de Teste para a fun��o fn_validate_email
-- ===================================================
SET SERVEROUTPUT ON;
DECLARE
    v_invalid_email_count NUMBER := 0;
BEGIN
    -- Contar quantos e-mails n�o seguem o formato correto
    SELECT COUNT(*)
    INTO v_invalid_email_count
    FROM t_ampz_user
    WHERE NOT REGEXP_LIKE(ds_email, '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    -- Exibir o n�mero de e-mails inv�lidos
    DBMS_OUTPUT.PUT_LINE('N�mero de e-mails inv�lidos: ' || v_invalid_email_count);
    
EXCEPTION
    WHEN OTHERS THEN
        -- Caso ocorra um erro inesperado, exibe a mensagem de erro
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/




