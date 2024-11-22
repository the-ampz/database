-- ===================================================
-- Pacote PL/SQL: pkg_tabelas.
-- ===================================================

CREATE OR REPLACE PACKAGE pkg_tabelas AS

  -- Declaração dos procedimentos
  PROCEDURE create_tables;
  PROCEDURE create_sequences;

END pkg_tabelas;
/

CREATE OR REPLACE PACKAGE BODY pkg_tabelas AS

  -- PROCEDURE PARA CRIAR AS TABELAS
  PROCEDURE create_tables IS
  BEGIN
    -- Criação das tabelas principais
    EXECUTE IMMEDIATE 'CREATE TABLE t_ampz_address (
        id_address    NUMBER PRIMARY KEY,
        ds_street     VARCHAR2(100),
        ds_number     VARCHAR2(10),
        ds_complement VARCHAR2(50),
        ds_district   VARCHAR2(50),
        ds_city       VARCHAR2(50),
        ds_state      VARCHAR2(50)
    )';
    
    EXECUTE IMMEDIATE 'CREATE TABLE t_ampz_user (
        id_user      NUMBER PRIMARY KEY,
        ds_name      VARCHAR2(100),
        ds_email     VARCHAR2(100) UNIQUE,
        ds_password  VARCHAR2(100),
        id_address   NUMBER,
        dt_birthdate DATE,
        CONSTRAINT fk_user_address FOREIGN KEY (id_address)
            REFERENCES t_ampz_address (id_address)
    )';

    EXECUTE IMMEDIATE 'CREATE TABLE t_ampz_kid (
        id_kid             NUMBER PRIMARY KEY,
        id_user            NUMBER,
        ds_name            VARCHAR2(100),
        dt_birthdate       DATE,
        total_score        NUMBER DEFAULT 0,
        total_energy_saved NUMBER DEFAULT 0,
        CONSTRAINT fk_kid_user FOREIGN KEY (id_user)
            REFERENCES t_ampz_user (id_user)
    )';

    EXECUTE IMMEDIATE 'CREATE TABLE t_ampz_device (
        id_device             NUMBER PRIMARY KEY,
        id_kid                NUMBER,
        ds_name               VARCHAR2(100),
        ds_type               VARCHAR2(50),
        ds_operating_system   VARCHAR2(50),
        vl_energy_consumption NUMBER,
        vl_energy_saved       NUMBER,
        CONSTRAINT fk_device_kid FOREIGN KEY (id_kid)
            REFERENCES t_ampz_kid (id_kid)
    )';

    EXECUTE IMMEDIATE 'CREATE TABLE t_ampz_community (
        id_community   NUMBER PRIMARY KEY,
        ds_name        VARCHAR2(100),
        ds_description CLOB,
        total_points   NUMBER DEFAULT 0
    )';

    EXECUTE IMMEDIATE 'CREATE TABLE t_ampz_community_participation (
        id_participation NUMBER PRIMARY KEY,
        id_kid           NUMBER,
        id_community     NUMBER,
        points           NUMBER DEFAULT 0,
        CONSTRAINT fk_participation_kid FOREIGN KEY (id_kid)
            REFERENCES t_ampz_kid (id_kid),
        CONSTRAINT fk_participation_community FOREIGN KEY (id_community)
            REFERENCES t_ampz_community (id_community)
    )';

    EXECUTE IMMEDIATE 'CREATE TABLE t_ampz_challenge_goal (
        id_challenge       NUMBER PRIMARY KEY,
        ds_description     CLOB,
        vl_score           NUMBER,
        dt_start           DATE,
        dt_end             DATE,
        vl_energy_required NUMBER,
        id_community       NUMBER,
        CONSTRAINT fk_challenge_community FOREIGN KEY (id_community)
            REFERENCES t_ampz_community (id_community)
    )';

    EXECUTE IMMEDIATE 'CREATE TABLE t_ampz_energy_consumption (
        id_energy_consumption NUMBER PRIMARY KEY,
        id_device             NUMBER,
        ds_consumption_type   VARCHAR2(50),
        vl_consumption        NUMBER,
        vl_energy_saved       NUMBER,
        dt_consumption        DATE,
        CONSTRAINT fk_energy_consumption_device FOREIGN KEY (id_device)
            REFERENCES t_ampz_device (id_device)
    )';

    EXECUTE IMMEDIATE 'CREATE TABLE t_ampz_score (
        id_score      NUMBER PRIMARY KEY,
        id_kid        NUMBER,
        id_challenge  NUMBER,
        vl_points     NUMBER,
        dt_completion DATE,
        CONSTRAINT fk_score_kid FOREIGN KEY (id_kid)
            REFERENCES t_ampz_kid (id_kid),
        CONSTRAINT fk_score_challenge FOREIGN KEY (id_challenge)
            REFERENCES t_ampz_challenge_goal (id_challenge)
    )';

    -- Criação das tabelas de auditoria
    EXECUTE IMMEDIATE 'CREATE TABLE t_audit_ampz_address (
        audit_id NUMBER PRIMARY KEY,
        id_address NUMBER,
        operation VARCHAR2(20),
        operation_date TIMESTAMP,
        old_street VARCHAR2(100),
        old_number VARCHAR2(10),
        new_street VARCHAR2(100),
        new_number VARCHAR2(10),
        CONSTRAINT fk_audit_address FOREIGN KEY (id_address)
            REFERENCES t_ampz_address (id_address)
    )';

    EXECUTE IMMEDIATE 'CREATE TABLE t_audit_ampz_user (
        audit_id NUMBER PRIMARY KEY,
        id_user NUMBER,
        operation VARCHAR2(20),
        operation_date TIMESTAMP,
        old_name VARCHAR2(100),
        old_email VARCHAR2(100),
        new_name VARCHAR2(100),
        new_email VARCHAR2(100),
        CONSTRAINT fk_audit_user FOREIGN KEY (id_user)
            REFERENCES t_ampz_user (id_user)
    )';

    EXECUTE IMMEDIATE 'CREATE TABLE t_audit_ampz_kid (
        audit_id NUMBER PRIMARY KEY,
        id_kid NUMBER,
        operation VARCHAR2(20),
        operation_date TIMESTAMP,
        old_name VARCHAR2(100),
        old_total_score NUMBER,
        new_name VARCHAR2(100),
        new_total_score NUMBER,
        CONSTRAINT fk_audit_kid FOREIGN KEY (id_kid)
            REFERENCES t_ampz_kid (id_kid)
    )';

    EXECUTE IMMEDIATE 'CREATE TABLE t_audit_ampz_device (
        audit_id NUMBER PRIMARY KEY,
        id_device NUMBER,
        id_kid NUMBER,
        operation VARCHAR2(20),
        operation_date TIMESTAMP,
        old_name VARCHAR2(100),
        old_energy_consumption NUMBER,
        new_name VARCHAR2(100),
        new_energy_consumption NUMBER,
        CONSTRAINT fk_audit_device FOREIGN KEY (id_device)
            REFERENCES t_ampz_device (id_device)
    )';

    EXECUTE IMMEDIATE 'CREATE TABLE t_audit_ampz_community (
        audit_id NUMBER PRIMARY KEY,
        id_community NUMBER,
        operation VARCHAR2(20),
        operation_date TIMESTAMP,
        old_name VARCHAR2(100),
        old_total_points NUMBER,
        new_name VARCHAR2(100),
        new_total_points NUMBER,
        CONSTRAINT fk_audit_community FOREIGN KEY (id_community)
            REFERENCES t_ampz_community (id_community)
    )';

    EXECUTE IMMEDIATE 'CREATE TABLE t_audit_ampz_community_participation (
        audit_id NUMBER PRIMARY KEY,
        id_participation NUMBER,
        id_kid NUMBER,
        id_community NUMBER,
        operation VARCHAR2(20),
        operation_date TIMESTAMP,
        old_points NUMBER,
        new_points NUMBER,
        CONSTRAINT fk_audit_participation FOREIGN KEY (id_participation)
            REFERENCES t_ampz_community_participation (id_participation),
        CONSTRAINT fk_audit_participation_kid FOREIGN KEY (id_kid)
            REFERENCES t_ampz_kid (id_kid),
        CONSTRAINT fk_audit_participation_community FOREIGN KEY (id_community)
            REFERENCES t_ampz_community (id_community)
    )';

    EXECUTE IMMEDIATE 'CREATE TABLE t_audit_ampz_challenge_goal (
        audit_id NUMBER PRIMARY KEY,
        id_challenge NUMBER,
        id_community NUMBER,
        operation VARCHAR2(20),
        operation_date TIMESTAMP,
        old_description CLOB,
        old_score NUMBER,
        new_description CLOB,
        new_score NUMBER,
        CONSTRAINT fk_audit_challenge FOREIGN KEY (id_challenge)
            REFERENCES t_ampz_challenge_goal (id_challenge),
        CONSTRAINT fk_audit_challenge_community FOREIGN KEY (id_community)
            REFERENCES t_ampz_community (id_community)
    )';

    EXECUTE IMMEDIATE 'CREATE TABLE t_audit_ampz_energy_consumption (
        audit_id NUMBER PRIMARY KEY,
        id_energy_consumption NUMBER,
        operation VARCHAR2(20),
        operation_date TIMESTAMP,
        old_consumption NUMBER,
        old_energy_saved NUMBER,
        new_consumption NUMBER,
        new_energy_saved NUMBER,
        CONSTRAINT fk_audit_energy_consumption FOREIGN KEY (id_energy_consumption)
            REFERENCES t_ampz_energy_consumption (id_energy_consumption)
    )';

    EXECUTE IMMEDIATE 'CREATE TABLE t_audit_ampz_score (
        audit_id NUMBER PRIMARY KEY,
        id_score NUMBER,
        id_kid NUMBER,
        id_challenge NUMBER,
        operation VARCHAR2(20),
        operation_date TIMESTAMP,
        old_points NUMBER,
        new_points NUMBER,
        CONSTRAINT fk_audit_score FOREIGN KEY (id_score)
            REFERENCES t_ampz_score (id_score),
        CONSTRAINT fk_audit_score_kid FOREIGN KEY (id_kid)
            REFERENCES t_ampz_kid (id_kid),
        CONSTRAINT fk_audit_score_challenge FOREIGN KEY (id_challenge)
            REFERENCES t_ampz_challenge_goal (id_challenge)
    )';

  END create_tables;

  -- PROCEDURE PARA CRIAR AS SEQUÊNCIAS
  PROCEDURE create_sequences IS
  BEGIN
    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_address START WITH 1 INCREMENT BY 1';
    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_user START WITH 1 INCREMENT BY 1';
    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_kid START WITH 1 INCREMENT BY 1';
    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_device START WITH 1 INCREMENT BY 1';
    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_community START WITH 1 INCREMENT BY 1';
    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_community_participation START WITH 1 INCREMENT BY 1';
    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_challenge_goal START WITH 1 INCREMENT BY 1';
    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_energy_consumption START WITH 1 INCREMENT BY 1';
    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_score START WITH 1 INCREMENT BY 1';
    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_audit_address START WITH 1 INCREMENT BY 1';
    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_audit_user START WITH 1 INCREMENT BY 1';
    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_audit_kid START WITH 1 INCREMENT BY 1';
    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_audit_device START WITH 1 INCREMENT BY 1';
    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_audit_community START WITH 1 INCREMENT BY 1';
    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_audit_community_participation START WITH 1 INCREMENT BY 1';
    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_audit_challenge_goal START WITH 1 INCREMENT BY 1';
    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_audit_energy_consumption START WITH 1 INCREMENT BY 1';
    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_audit_score START WITH 1 INCREMENT BY 1';
  END create_sequences;

END pkg_tabelas;
/

-- ===================================================
-- Bloco de Execução para Testar a Criação das Tabelas
-- ===================================================
BEGIN
  pkg_tabelas.create_tables;
  pkg_tabelas.create_sequences;
END;
/

-- ===================================================
-- Pacote para funções de cálculo de consumo de energia e validação de e-mail
-- ===================================================
CREATE OR REPLACE PACKAGE pkg_funcoes AS

    FUNCTION fn_calculate_total_consumption(p_id_device IN NUMBER) 
    RETURN NUMBER;

    FUNCTION fn_validate_email(p_email IN VARCHAR2) 
    RETURN BOOLEAN;

END pkg_funcoes;
/

-- ===================================================
-- Corpo do Pacote com a implementação das funções
-- ===================================================
CREATE OR REPLACE PACKAGE BODY pkg_funcoes AS

    FUNCTION fn_calculate_total_consumption(p_id_device IN NUMBER) 
    RETURN NUMBER 
    IS
        v_total_consumption NUMBER := 0;
        v_device_count NUMBER := 0;
        v_consumption_count NUMBER := 0;
    BEGIN
        IF p_id_device IS NULL OR p_id_device <= 0 THEN
            RAISE_APPLICATION_ERROR(-20004, 'ID do dispositivo inválido fornecido.');
        END IF;

        BEGIN
            SELECT COUNT(*)
            INTO v_device_count
            FROM t_ampz_device
            WHERE id_device = p_id_device;
        EXCEPTION
            WHEN OTHERS THEN
                RAISE_APPLICATION_ERROR(-20009, 'Erro ao verificar a existência do dispositivo: ' || SQLERRM);
        END;

        IF v_device_count = 0 THEN
            RAISE_APPLICATION_ERROR(-20008, 'Dispositivo não encontrado com o ID fornecido.');
        END IF;

        BEGIN
            SELECT SUM(vl_consumption)
            INTO v_total_consumption
            FROM t_ampz_energy_consumption
            WHERE id_device = p_id_device;

            SELECT COUNT(*)
            INTO v_consumption_count
            FROM t_ampz_energy_consumption
            WHERE id_device = p_id_device;

            IF v_consumption_count = 0 THEN
                RAISE_APPLICATION_ERROR(-20010, 'Nenhum dado de consumo encontrado para o dispositivo fornecido.');
            END IF;

            IF v_total_consumption IS NULL THEN
                v_total_consumption := 0;
            END IF;

        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                v_total_consumption := 0;
            WHEN VALUE_ERROR THEN
                RAISE_APPLICATION_ERROR(-20005, 'Erro de tipo de dado ao calcular o consumo de energia.');
            WHEN OTHERS THEN
                RAISE_APPLICATION_ERROR(-20011, 'Erro inesperado ao acessar os dados de consumo de energia: ' || SQLERRM);
        END;

        RETURN v_total_consumption;
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20007, 'Ocorreu um erro ao processar o consumo total: ' || SQLERRM);
    END fn_calculate_total_consumption;

    FUNCTION fn_validate_email(p_email IN VARCHAR2) 
    RETURN BOOLEAN 
    IS
        v_valid BOOLEAN := FALSE;
        v_email_count NUMBER;
    BEGIN
        IF p_email IS NULL THEN
            RAISE_APPLICATION_ERROR(-20001, 'O e-mail não pode ser NULL.');
        END IF;

        IF NOT REGEXP_LIKE(p_email, '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$') THEN
            RAISE_APPLICATION_ERROR(-20002, 'O formato do e-mail é inválido.');
        END IF;

        SELECT COUNT(*)
        INTO v_email_count
        FROM t_ampz_user
        WHERE ds_email = p_email;

        IF v_email_count > 0 THEN
            RAISE_APPLICATION_ERROR(-20003, 'Este e-mail já está cadastrado.');
        ELSE
            v_valid := TRUE;
        END IF;

        RETURN v_valid;

    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20004, 'Ocorreu um erro ao validar o e-mail.');
    END fn_validate_email;

END pkg_funcoes;
/

-- ===================================================
-- Bloco de Teste para as funções fn_calculate_total_consumption e fn_validate_email
-- ===================================================
SET SERVEROUTPUT ON;
DECLARE
    v_device_id NUMBER := 1;  -- ID do dispositivo a ser verificado
    v_total_consumption NUMBER;
    v_email VARCHAR2(100) := 'test@example.com';  -- E-mail a ser validado
    v_email_valid BOOLEAN;
BEGIN
    -- Chamar a função para calcular o consumo total de energia
    v_total_consumption := pkg_funcoes.fn_calculate_total_consumption(v_device_id);
    DBMS_OUTPUT.PUT_LINE('O consumo total de energia do dispositivo ID ' || v_device_id || ' é: ' || v_total_consumption || ' kWh.');

    -- Chamar a função para validar o e-mail
    v_email_valid := pkg_funcoes.fn_validate_email(v_email);
    IF v_email_valid THEN
        DBMS_OUTPUT.PUT_LINE('O e-mail ' || v_email || ' é válido e não está duplicado.');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        -- Caso ocorra um erro inesperado, exibe a mensagem de erro
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/

-- ===================================================
-- Pacote PL/SQL: pkg_insert_data
-- ===================================================
CREATE OR REPLACE PACKAGE pkg_insert_data AS
    -- Procedure to add a new user
    PROCEDURE add_user(p_name VARCHAR2, p_email VARCHAR2, p_password VARCHAR2, p_address_id NUMBER, p_birthdate DATE);

    -- Procedure to add a new kid
    PROCEDURE add_kid(p_user_id NUMBER, p_name VARCHAR2, p_birthdate DATE);

    -- Procedure to add a new device
    PROCEDURE add_device(p_kid_id NUMBER, p_name VARCHAR2, p_type VARCHAR2, p_operating_system VARCHAR2, p_energy_consumption NUMBER);

    -- Procedure to add a new community
    PROCEDURE add_community(p_name VARCHAR2, p_description CLOB);

    -- Procedure to add a new challenge goal
    PROCEDURE add_challenge_goal(p_community_id NUMBER, p_description CLOB, p_score NUMBER, p_start_date DATE, p_end_date DATE, p_energy_required NUMBER);

    -- Procedure to add energy consumption data
    PROCEDURE add_energy_consumption(p_device_id NUMBER, p_consumption_type VARCHAR2, p_consumption NUMBER, p_energy_saved NUMBER, p_consumption_date DATE);

    -- Procedure to add score for a kid in a challenge
    PROCEDURE add_score(p_kid_id NUMBER, p_challenge_id NUMBER, p_points NUMBER, p_completion_date DATE);

    -- Procedure to add a new address
    PROCEDURE add_address(p_street VARCHAR2, p_number VARCHAR2, p_city VARCHAR2, p_state VARCHAR2, p_zip VARCHAR2, p_country VARCHAR2);

    -- Procedure to add a device category
    PROCEDURE add_device_category(p_category_name VARCHAR2, p_description VARCHAR2);

END pkg_insert_data;
/

CREATE OR REPLACE PACKAGE BODY pkg_insert_data AS

    PROCEDURE add_user(p_name VARCHAR2, p_email VARCHAR2, p_password VARCHAR2, p_address_id NUMBER, p_birthdate DATE) IS
    BEGIN
        INSERT INTO t_ampz_user (id_user, ds_name, ds_email, ds_password, id_address, dt_birthdate)
        VALUES (seq_t_ampz_user.NEXTVAL, p_name, p_email, p_password, p_address_id, p_birthdate);
    END add_user;

    PROCEDURE add_kid(p_user_id NUMBER, p_name VARCHAR2, p_birthdate DATE) IS
    BEGIN
        INSERT INTO t_ampz_kid (id_kid, id_user, ds_name, dt_birthdate)
        VALUES (seq_t_ampz_kid.NEXTVAL, p_user_id, p_name, p_birthdate);
    END add_kid;

    PROCEDURE add_device(p_kid_id NUMBER, p_name VARCHAR2, p_type VARCHAR2, p_operating_system VARCHAR2, p_energy_consumption NUMBER) IS
    BEGIN
        INSERT INTO t_ampz_device (id_device, id_kid, ds_name, ds_type, ds_operating_system, vl_energy_consumption)
        VALUES (seq_t_ampz_device.NEXTVAL, p_kid_id, p_name, p_type, p_operating_system, p_energy_consumption);
    END add_device;

    PROCEDURE add_community(p_name VARCHAR2, p_description CLOB) IS
    BEGIN
        INSERT INTO t_ampz_community (id_community, ds_name, ds_description)
        VALUES (seq_t_ampz_community.NEXTVAL, p_name, p_description);
    END add_community;

    PROCEDURE add_challenge_goal(p_community_id NUMBER, p_description CLOB, p_score NUMBER, p_start_date DATE, p_end_date DATE, p_energy_required NUMBER) IS
    BEGIN
        INSERT INTO t_ampz_challenge_goal (id_challenge, ds_description, vl_score, dt_start, dt_end, vl_energy_required, id_community)
        VALUES (seq_t_ampz_challenge_goal.NEXTVAL, p_description, p_score, p_start_date, p_end_date, p_energy_required, p_community_id);
    END add_challenge_goal;

    PROCEDURE add_energy_consumption(p_device_id NUMBER, p_consumption_type VARCHAR2, p_consumption NUMBER, p_energy_saved NUMBER, p_consumption_date DATE) IS
    BEGIN
        INSERT INTO t_ampz_energy_consumption (id_energy_consumption, id_device, ds_consumption_type, vl_consumption, vl_energy_saved, dt_consumption)
        VALUES (seq_t_ampz_energy_consumption.NEXTVAL, p_device_id, p_consumption_type, p_consumption, p_energy_saved, p_consumption_date);
    END add_energy_consumption;

    PROCEDURE add_score(p_kid_id NUMBER, p_challenge_id NUMBER, p_points NUMBER, p_completion_date DATE) IS
    BEGIN
        INSERT INTO t_ampz_score (id_score, id_kid, id_challenge, vl_points, dt_completion)
        VALUES (seq_t_ampz_score.NEXTVAL, p_kid_id, p_challenge_id, p_points, p_completion_date);
    END add_score;

    -- Nova procedure para adicionar um endereço
    PROCEDURE add_address(p_street VARCHAR2, p_number VARCHAR2, p_city VARCHAR2, p_state VARCHAR2, p_zip VARCHAR2, p_country VARCHAR2) IS
    BEGIN
        INSERT INTO t_ampz_address (id_address, ds_street, ds_number, ds_city, ds_state, ds_zip, ds_country)
        VALUES (seq_t_ampz_address.NEXTVAL, p_street, p_number, p_city, p_state, p_zip, p_country);
    END add_address;

    -- Nova procedure para adicionar uma categoria de dispositivo
    PROCEDURE add_device_category(p_category_name VARCHAR2, p_description VARCHAR2) IS
    BEGIN
        INSERT INTO t_ampz_device_category (id_category, ds_name, ds_description)
        VALUES (seq_t_ampz_device_category.NEXTVAL, p_category_name, p_description);
    END add_device_category;

END pkg_insert_data;
/

-- ===================================================
-- Bloco de Teste para a PACKAGE pkg_insert_data
-- ===================================================

