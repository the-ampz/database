CREATE OR REPLACE PROCEDURE export_data IS
    -- Variáveis temporárias
    v_json_data CLOB;
    v_json_table CLOB;
BEGIN
    -- Iniciar o JSON principal
    v_json_table := '{ "data": [';

    -- JSON para a tabela t_ampz_address
    v_json_table := v_json_table || '{"t_ampz_address": [';
    FOR rec IN (
        SELECT id_address, ds_street, ds_number, ds_complement, ds_district, ds_city, ds_state
        FROM t_ampz_address
    ) LOOP
        v_json_data := JSON_OBJECT(
            'id_address'      VALUE rec.id_address,
            'ds_street'       VALUE rec.ds_street,
            'ds_number'       VALUE rec.ds_number,
            'ds_complement'   VALUE rec.ds_complement,
            'ds_district'     VALUE rec.ds_district,
            'ds_city'         VALUE rec.ds_city,
            'ds_state'        VALUE rec.ds_state
        );
        v_json_table := v_json_table || v_json_data || ',';
    END LOOP;
    v_json_table := RTRIM(v_json_table, ',') || '],';

    -- JSON para a tabela t_ampz_user
    v_json_table := v_json_table || '"t_ampz_user": [';
    FOR rec IN (
        SELECT id_user, ds_name, ds_email, ds_password, id_address, dt_birthdate
        FROM t_ampz_user
    ) LOOP
        v_json_data := JSON_OBJECT(
            'id_user'         VALUE rec.id_user,
            'ds_name'         VALUE rec.ds_name,
            'ds_email'        VALUE rec.ds_email,
            'ds_password'     VALUE rec.ds_password,
            'id_address'      VALUE rec.id_address,
            'dt_birthdate'    VALUE rec.dt_birthdate
        );
        v_json_table := v_json_table || v_json_data || ',';
    END LOOP;
    v_json_table := RTRIM(v_json_table, ',') || '],';

    -- JSON para a tabela t_ampz_kid
    v_json_table := v_json_table || '"t_ampz_kid": [';
    FOR rec IN (
        SELECT id_kid, id_user, ds_name, dt_birthdate, total_score, total_energy_saved
        FROM t_ampz_kid
    ) LOOP
        v_json_data := JSON_OBJECT(
            'id_kid'          VALUE rec.id_kid,
            'id_user'         VALUE rec.id_user,
            'ds_name'         VALUE rec.ds_name,
            'dt_birthdate'    VALUE rec.dt_birthdate,
            'total_score'     VALUE rec.total_score,
            'total_energy_saved' VALUE rec.total_energy_saved
        );
        v_json_table := v_json_table || v_json_data || ',';
    END LOOP;
    v_json_table := RTRIM(v_json_table, ',') || '],';

    -- JSON para a tabela t_ampz_device
    v_json_table := v_json_table || '"t_ampz_device": [';
    FOR rec IN (
        SELECT id_device, id_kid, ds_name, ds_type, ds_operating_system, vl_energy_consumption, vl_energy_saved
        FROM t_ampz_device
    ) LOOP
        v_json_data := JSON_OBJECT(
            'id_device'       VALUE rec.id_device,
            'id_kid'          VALUE rec.id_kid,
            'ds_name'         VALUE rec.ds_name,
            'ds_type'         VALUE rec.ds_type,
            'ds_operating_system' VALUE rec.ds_operating_system,
            'vl_energy_consumption' VALUE rec.vl_energy_consumption,
            'vl_energy_saved' VALUE rec.vl_energy_saved
        );
        v_json_table := v_json_table || v_json_data || ',';
    END LOOP;
    v_json_table := RTRIM(v_json_table, ',') || '],';

    -- JSON para a tabela t_ampz_community
    v_json_table := v_json_table || '"t_ampz_community": [';
    FOR rec IN (
        SELECT id_community, ds_name, ds_description, total_points
        FROM t_ampz_community
    ) LOOP
        v_json_data := JSON_OBJECT(
            'id_community'    VALUE rec.id_community,
            'ds_name'         VALUE rec.ds_name,
            'ds_description'  VALUE rec.ds_description,
            'total_points'    VALUE rec.total_points
        );
        v_json_table := v_json_table || v_json_data || ',';
    END LOOP;
    v_json_table := RTRIM(v_json_table, ',') || '],';

    -- JSON para a tabela t_ampz_community_participation
    v_json_table := v_json_table || '"t_ampz_community_participation": [';
    FOR rec IN (
        SELECT id_participation, id_kid, id_community, points
        FROM t_ampz_community_participation
    ) LOOP
        v_json_data := JSON_OBJECT(
            'id_participation' VALUE rec.id_participation,
            'id_kid'           VALUE rec.id_kid,
            'id_community'     VALUE rec.id_community,
            'points'           VALUE rec.points
        );
        v_json_table := v_json_table || v_json_data || ',';
    END LOOP;
    v_json_table := RTRIM(v_json_table, ',') || '],';

    -- JSON para a tabela t_ampz_challenge_goal
    v_json_table := v_json_table || '"t_ampz_challenge_goal": [';
    FOR rec IN (
        SELECT id_challenge, ds_description, vl_score, dt_start, dt_end, vl_energy_required, id_community
        FROM t_ampz_challenge_goal
    ) LOOP
        v_json_data := JSON_OBJECT(
            'id_challenge'     VALUE rec.id_challenge,
            'ds_description'   VALUE rec.ds_description,
            'vl_score'         VALUE rec.vl_score,
            'dt_start'         VALUE rec.dt_start,
            'dt_end'           VALUE rec.dt_end,
            'vl_energy_required' VALUE rec.vl_energy_required,
            'id_community'     VALUE rec.id_community
        );
        v_json_table := v_json_table || v_json_data || ',';
    END LOOP;
    v_json_table := RTRIM(v_json_table, ',') || '],';

    -- JSON para a tabela t_ampz_energy_consumption
    v_json_table := v_json_table || '"t_ampz_energy_consumption": [';
    FOR rec IN (
        SELECT id_energy_consumption, id_device, ds_consumption_type, vl_consumption, vl_energy_saved, dt_consumption
        FROM t_ampz_energy_consumption
    ) LOOP
        v_json_data := JSON_OBJECT(
            'id_energy_consumption' VALUE rec.id_energy_consumption,
            'id_device'             VALUE rec.id_device,
            'ds_consumption_type'   VALUE rec.ds_consumption_type,
            'vl_consumption'        VALUE rec.vl_consumption,
            'vl_energy_saved'       VALUE rec.vl_energy_saved,
            'dt_consumption'        VALUE rec.dt_consumption
        );
        v_json_table := v_json_table || v_json_data || ',';
    END LOOP;
    v_json_table := RTRIM(v_json_table, ',') || '],';

    -- JSON para a tabela t_ampz_score
    v_json_table := v_json_table || '"t_ampz_score": [';
    FOR rec IN (
        SELECT id_score, id_kid, id_challenge, vl_points, dt_completion
        FROM t_ampz_score
    ) LOOP
        v_json_data := JSON_OBJECT(
            'id_score'        VALUE rec.id_score,
            'id_kid'          VALUE rec.id_kid,
            'id_challenge'    VALUE rec.id_challenge,
            'vl_points'       VALUE rec.vl_points,
            'dt_completion'   VALUE rec.dt_completion
        );
        v_json_table := v_json_table || v_json_data || ',';
    END LOOP;
    v_json_table := RTRIM(v_json_table, ',') || ']}';

    -- Finalizando o JSON
    DBMS_OUTPUT.PUT_LINE(v_json_table);
END export_data;
/


SET SERVEROUTPUT ON SIZE UNLIMITED;
SET FEEDBACK OFF;
SET TERMOUT OFF;
SET LINESIZE 1000;

SPOOL C:\WorkSpaces\Ampz\DataSet\export_data.json
BEGIN
    export_data;
END;
/
SPOOL OFF;

SET FEEDBACK ON;
SET TERMOUT ON;
