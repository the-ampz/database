---- Criar o diretório no Oracle (execute este comando apenas uma vez)
CREATE OR REPLACE DIRECTORY DIRETORIO_JSON AS 'C:\AMPZDataSet';
GRANT READ, WRITE ON DIRECTORY DIRETORIO_JSON TO FIAP_MICHAEL;

-- Procedure para exportar cada tabela em arquivos JSON separados
CREATE OR REPLACE PROCEDURE exportar_tabelas_separadas AS
    v_json_output CLOB;
    v_file_handle UTL_FILE.FILE_TYPE; -- Declaração da variável aqui

BEGIN
    -- Exportar t_gxp_address
    v_json_output := '{';
    SELECT JSON_ARRAYAGG(JSON_OBJECT(
        'id_address' VALUE id_address,
        'ds_street' VALUE ds_street,
        'ds_number' VALUE ds_number,
        'ds_complement' VALUE ds_complement,
        'ds_district' VALUE ds_district,
        'ds_city' VALUE ds_city,
        'ds_state' VALUE ds_state
    )) INTO v_json_output
    FROM t_gxp_address;

    v_json_output := v_json_output || '}';
    
    BEGIN
        v_file_handle := UTL_FILE.FOPEN('DIRETORIO_JSON', 't_gxp_address.json', 'w');
        UTL_FILE.PUT_LINE(v_file_handle, v_json_output);
        UTL_FILE.FCLOSE(v_file_handle);
    EXCEPTION
        WHEN OTHERS THEN
            IF UTL_FILE.IS_OPEN(v_file_handle) THEN
                UTL_FILE.FCLOSE(v_file_handle);
            END IF;
            DBMS_OUTPUT.PUT_LINE('Erro ao exportar t_gxp_address: ' || SQLERRM);
            RAISE;
    END;

    -- Continue com as exportações para as outras tabelas...
    -- Exemplo para t_gxp_user
    v_json_output := '{';
    SELECT JSON_ARRAYAGG(JSON_OBJECT(
        'id_user' VALUE id_user,
        'ds_name' VALUE ds_name,
        'ds_email' VALUE ds_email,
        'dt_birthdate' VALUE dt_birthdate,
        'id_address' VALUE id_address
    )) INTO v_json_output
    FROM t_gxp_user;

    v_json_output := v_json_output || '}';
    
    BEGIN
        v_file_handle := UTL_FILE.FOPEN('DIRETORIO_JSON', 't_gxp_user.json', 'w');
        UTL_FILE.PUT_LINE(v_file_handle, v_json_output);
        UTL_FILE.FCLOSE(v_file_handle);
    EXCEPTION
        WHEN OTHERS THEN
            IF UTL_FILE.IS_OPEN(v_file_handle) THEN
                UTL_FILE.FCLOSE(v_file_handle);
            END IF;
            DBMS_OUTPUT.PUT_LINE('Erro ao exportar t_gxp_user: ' || SQLERRM);
            RAISE;
    END;

    -- Continue para as outras tabelas conforme necessário...

END exportar_tabelas_separadas;
/

-- Procedure para exportar todas as tabelas em um único arquivo JSON
CREATE OR REPLACE PROCEDURE exportar_todas_as_tabelas AS
    v_json_output CLOB;
    v_file_handle UTL_FILE.FILE_TYPE; -- Declaração da variável aqui
BEGIN
    -- Inicia o objeto JSON
    v_json_output := '{';

    -- Exportar t_gxp_address
    v_json_output := v_json_output || '"t_gxp_address": ';
    SELECT JSON_ARRAYAGG(JSON_OBJECT(
        'id_address' VALUE id_address,
        'ds_street' VALUE ds_street,
        'ds_number' VALUE ds_number,
        'ds_complement' VALUE ds_complement,
        'ds_district' VALUE ds_district,
        'ds_city' VALUE ds_city,
        'ds_state' VALUE ds_state
    )) INTO v_json_output
    FROM t_gxp_address;

    v_json_output := v_json_output || ',';

    -- Exportar t_gxp_user
    v_json_output := v_json_output || '"t_gxp_user": ';
    SELECT JSON_ARRAYAGG(JSON_OBJECT(
        'id_user' VALUE id_user,
        'ds_name' VALUE ds_name,
        'ds_email' VALUE ds_email,
        'dt_birthdate' VALUE dt_birthdate,
        'id_address' VALUE id_address
    )) INTO v_json_output
    FROM t_gxp_user;

    v_json_output := v_json_output || ',';

    -- Continue para as outras tabelas conforme necessário...

    -- Finaliza o objeto JSON
    v_json_output := v_json_output || '}';

    -- Escreve o JSON em um arquivo
    BEGIN
        v_file_handle := UTL_FILE.FOPEN('DIRETORIO_JSON', 'dataset.json', 'w');
        UTL_FILE.PUT_LINE(v_file_handle, v_json_output);
        UTL_FILE.FCLOSE(v_file_handle);
    EXCEPTION
        WHEN OTHERS THEN
            IF UTL_FILE.IS_OPEN(v_file_handle) THEN
                UTL_FILE.FCLOSE(v_file_handle);
            END IF;
            DBMS_OUTPUT.PUT_LINE('Erro ao exportar o dataset: ' || SQLERRM);
            RAISE;
    END;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro geral: ' || SQLERRM);
        RAISE;
END exportar_todas_as_tabelas;
/

-- Exemplo de execução das procedures
BEGIN
    exportar_tabelas_separadas; -- Chama a exportação separada
    exportar_todas_as_tabelas; -- Chama a exportação única
END;
/