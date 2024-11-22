-- DROPs para remover as procedures:
-- DROP PROCEDURE insert_score;
-- DROP PROCEDURE insert_energy_consumption;
-- DROP PROCEDURE insert_challenge;
-- DROP PROCEDURE insert_community_participation;
-- DROP PROCEDURE insert_community;
-- DROP PROCEDURE insert_device;
-- DROP PROCEDURE insert_kid;
-- DROP PROCEDURE insert_user;
-- DROP PROCEDURE insert_address;

-- Procedure para inserir Endereços
CREATE OR REPLACE PROCEDURE insert_address (
    p_ds_street IN VARCHAR2,
    p_ds_number IN VARCHAR2,
    p_ds_complement IN VARCHAR2,
    p_ds_district IN VARCHAR2,
    p_ds_city IN VARCHAR2,
    p_ds_state IN VARCHAR2
) AS
    ex_insufficient_data EXCEPTION;
    v_id_address NUMBER;
BEGIN
    IF p_ds_street IS NULL OR p_ds_number IS NULL THEN
        RAISE ex_insufficient_data;
    END IF;

    SELECT seq_t_ampz_address.NEXTVAL INTO v_id_address FROM dual;

    INSERT INTO T_ampz_ADDRESS (id_address, ds_street, ds_number, ds_complement, ds_district, ds_city, ds_state)
    VALUES (v_id_address, p_ds_street, p_ds_number, p_ds_complement, p_ds_district, p_ds_city, p_ds_state);

EXCEPTION
    WHEN ex_insufficient_data THEN
        DBMS_OUTPUT.PUT_LINE('Erro! Dados insuficientes para endereço.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Um erro inesperado aconteceu: ' || SQLERRM);
END;
/

-- Procedure para Inserir Usuários
CREATE OR REPLACE PROCEDURE insert_user (
    p_ds_name IN VARCHAR2,
    p_ds_email IN VARCHAR2,
    p_ds_password IN VARCHAR2,
    p_id_address IN NUMBER,
    p_dt_birthdate IN DATE
) AS
    ex_insufficient_data EXCEPTION;
    v_id_user NUMBER;
BEGIN
    IF p_ds_name IS NULL OR p_ds_email IS NULL OR p_id_address IS NULL THEN
        RAISE ex_insufficient_data;
    END IF;

    SELECT seq_t_ampz_user.NEXTVAL INTO v_id_user FROM dual;

    INSERT INTO T_ampz_USER (id_user, ds_name, ds_email, ds_password, id_address, dt_birthdate)
    VALUES (v_id_user, p_ds_name, p_ds_email, p_ds_password, p_id_address, p_dt_birthdate);

EXCEPTION
    WHEN ex_insufficient_data THEN
        DBMS_OUTPUT.PUT_LINE('Erro! Dados insuficientes para usuário.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Um erro inesperado aconteceu: ' || SQLERRM);
END;
/

-- Procedure para Inserir Crianças
CREATE OR REPLACE PROCEDURE insert_kid (
    p_id_user IN NUMBER,
    p_ds_name IN VARCHAR2,
    p_dt_birthdate IN DATE
) AS
    ex_insufficient_data EXCEPTION;
    v_id_kid NUMBER;
BEGIN
    IF p_id_user IS NULL OR p_ds_name IS NULL THEN
        RAISE ex_insufficient_data;
    END IF;

    SELECT seq_t_ampz_kid.NEXTVAL INTO v_id_kid FROM dual;

    INSERT INTO T_ampz_KID (id_kid, id_user, ds_name, dt_birthdate)
    VALUES (v_id_kid, p_id_user, p_ds_name, p_dt_birthdate);

EXCEPTION
    WHEN ex_insufficient_data THEN
        DBMS_OUTPUT.PUT_LINE('Erro! Dados insuficientes para criança.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Um erro inesperado aconteceu: ' || SQLERRM);
END;
/

-- Procedure para Inserir Dispositivos
CREATE OR REPLACE PROCEDURE insert_device (
    p_id_kid IN NUMBER,
    p_ds_name IN VARCHAR2,
    p_ds_type IN VARCHAR2,
    p_ds_operating_system IN VARCHAR2,
    p_vl_energy_consumption IN NUMBER,
    p_vl_energy_saved IN NUMBER
) AS
    ex_insufficient_data EXCEPTION;
    v_id_device NUMBER;
BEGIN
    IF p_id_kid IS NULL OR p_ds_name IS NULL OR p_ds_type IS NULL THEN
        RAISE ex_insufficient_data;
    END IF;

    SELECT seq_t_ampz_device.NEXTVAL INTO v_id_device FROM dual;

    INSERT INTO T_ampz_DEVICE (id_device, id_kid, ds_name, ds_type, ds_operating_system, vl_energy_consumption, vl_energy_saved)
    VALUES (v_id_device, p_id_kid, p_ds_name, p_ds_type, p_ds_operating_system, p_vl_energy_consumption, p_vl_energy_saved);

EXCEPTION
    WHEN ex_insufficient_data THEN
        DBMS_OUTPUT.PUT_LINE('Erro! Dados insuficientes para dispositivo.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Um erro inesperado aconteceu: ' || SQLERRM);
END;
/

-- Procedure para Inserir Comunidades
CREATE OR REPLACE PROCEDURE insert_community (
    p_ds_name IN VARCHAR2,
    p_ds_description IN CLOB
) AS
    ex_insufficient_data EXCEPTION;
    v_id_community NUMBER;
BEGIN
    IF p_ds_name IS NULL THEN
        RAISE ex_insufficient_data;
    END IF;

    SELECT seq_t_ampz_community.NEXTVAL INTO v_id_community FROM dual;

    INSERT INTO T_ampz_COMMUNITY (id_community, ds_name, ds_description)
    VALUES (v_id_community, p_ds_name, p_ds_description);

EXCEPTION
    WHEN ex_insufficient_data THEN
        DBMS_OUTPUT.PUT_LINE('Erro! Dados insuficientes para comunidade.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Um erro inesperado aconteceu: ' || SQLERRM);
END;
/

-- Procedure para Inserir Participação em Comunidades
CREATE OR REPLACE PROCEDURE insert_community_participation (
    p_id_kid IN NUMBER,
    p_id_community IN NUMBER,
    p_points IN NUMBER
) AS
    ex_insufficient_data EXCEPTION;
    v_id_participation NUMBER;
BEGIN
    IF p_id_kid IS NULL OR p_id_community IS NULL OR p_points IS NULL THEN
        RAISE ex_insufficient_data;
    END IF;

    SELECT seq_t_ampz_community_participation.NEXTVAL INTO v_id_participation FROM dual;

    INSERT INTO T_ampz_COMMUNITY_PARTICIPATION (id_participation, id_kid, id_community, points)
    VALUES (v_id_participation, p_id_kid, p_id_community, p_points);

EXCEPTION
    WHEN ex_insufficient_data THEN
        DBMS_OUTPUT.PUT_LINE('Erro! Dados insuficientes para participação em comunidade.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Um erro inesperado aconteceu: ' || SQLERRM);
END;
/

-- Procedure para Inserir Desafios
CREATE OR REPLACE PROCEDURE insert_challenge (
    p_ds_description IN CLOB,
    p_vl_score IN NUMBER,
    p_dt_start IN DATE,
    p_dt_end IN DATE,
    p_vl_energy_required IN NUMBER,
    p_id_community IN NUMBER
) AS
    ex_insufficient_data EXCEPTION;
    v_id_challenge NUMBER;
BEGIN
    IF p_ds_description IS NULL OR p_id_community IS NULL THEN
        RAISE ex_insufficient_data;
    END IF;

    SELECT seq_t_ampz_challenge_goal.NEXTVAL INTO v_id_challenge FROM dual;

    INSERT INTO T_ampz_CHALLENGE_GOAL (id_challenge, ds_description, vl_score, dt_start, dt_end, vl_energy_required, id_community)
    VALUES (v_id_challenge, p_ds_description, p_vl_score, p_dt_start, p_dt_end, p_vl_energy_required, p_id_community);

EXCEPTION
    WHEN ex_insufficient_data THEN
        DBMS_OUTPUT.PUT_LINE('Erro! Dados insuficientes para desafio.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Um erro inesperado aconteceu: ' || SQLERRM);
END;
/

-- Procedure para Inserir Consumo de Energia
CREATE OR REPLACE PROCEDURE insert_energy_consumption (
    p_id_device IN NUMBER,
    p_ds_consumption_type IN VARCHAR2,
    p_vl_consumption IN NUMBER,
    p_vl_energy_saved IN NUMBER,
    p_dt_consumption IN DATE
) AS
    ex_insufficient_data EXCEPTION;
    v_id_energy_consumption NUMBER;
BEGIN
    IF p_id_device IS NULL OR p_ds_consumption_type IS NULL OR p_vl_consumption IS NULL THEN
        RAISE ex_insufficient_data;
    END IF;

    SELECT seq_t_ampz_energy_consumption.NEXTVAL INTO v_id_energy_consumption FROM dual;

    INSERT INTO T_ampz_ENERGY_CONSUMPTION (id_energy_consumption, id_device, ds_consumption_type, vl_consumption, vl_energy_saved, dt_consumption)
    VALUES (v_id_energy_consumption, p_id_device, p_ds_consumption_type, p_vl_consumption, p_vl_energy_saved, p_dt_consumption);

EXCEPTION
    WHEN ex_insufficient_data THEN
        DBMS_OUTPUT.PUT_LINE('Erro! Dados insuficientes para consumo de energia.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Um erro inesperado aconteceu: ' || SQLERRM);
END;
/

-- Procedure para Inserir Pontuação
CREATE OR REPLACE PROCEDURE insert_score (
    p_id_kid IN NUMBER,
    p_id_challenge IN NUMBER,
    p_vl_points IN NUMBER,
    p_dt_completion IN DATE
) AS
    ex_insufficient_data EXCEPTION;
    v_id_score NUMBER;
BEGIN
    IF p_id_kid IS NULL OR p_id_challenge IS NULL OR p_vl_points IS NULL THEN
        RAISE ex_insufficient_data;
    END IF;

    SELECT seq_t_ampz_score.NEXTVAL INTO v_id_score FROM dual;

    INSERT INTO T_ampz_SCORE (id_score, id_kid, id_challenge, vl_points, dt_completion)
    VALUES (v_id_score, p_id_kid, p_id_challenge, p_vl_points, p_dt_completion);

EXCEPTION
    WHEN ex_insufficient_data THEN
        DBMS_OUTPUT.PUT_LINE('Erro! Dados insuficientes para pontuação.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Um erro inesperado aconteceu: ' || SQLERRM);
END;
/