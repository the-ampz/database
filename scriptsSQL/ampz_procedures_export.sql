CREATE OR REPLACE PROCEDURE export_t_ampz_address IS
    v_json_data    CLOB;
    v_json_table   CLOB;
    v_first_record BOOLEAN := TRUE;
BEGIN
    v_json_table := '[';
    FOR rec IN (
        SELECT
            id_address,
            ds_street,
            ds_number,
            nvl(ds_complement, 'null') AS ds_complement,
            ds_district,
            ds_city,
            ds_state
        FROM
            t_ampz_address
    ) LOOP
        IF NOT v_first_record THEN
            v_json_table := v_json_table || ',';
        END IF;
        v_first_record := FALSE;
        v_json_data := '{"id_address": '
                       || rec.id_address
                       || ','
                       || '"ds_street": '
                       || '"'
                       || replace(rec.ds_street, '"', '\"')
                       || '",'
                       || '"ds_number": '
                       || '"'
                       || replace(rec.ds_number, '"', '\"')
                       || '",'
                       || '"ds_complement": '
                       ||
            CASE
                WHEN rec.ds_complement = 'null' THEN
                    'null'
                ELSE '"'
                     || replace(rec.ds_complement, '"', '\"')
                     || '"'
            END
                       || ','
                       || '"ds_district": '
                       || '"'
                       || replace(rec.ds_district, '"', '\"')
                       || '",'
                       || '"ds_city": '
                       || '"'
                       || replace(rec.ds_city, '"', '\"')
                       || '",'
                       || '"ds_state": '
                       || '"'
                       || replace(rec.ds_state, '"', '\"')
                       || '"}';

        v_json_table := v_json_table || v_json_data;
    END LOOP;

    v_json_table := v_json_table || ']';
    dbms_output.put_line(v_json_table);
END export_t_ampz_address;
/

SET SERVEROUTPUT ON SIZE UNLIMITED;
SET FEEDBACK OFF;
SET TERMOUT OFF;

SPOOL C:\WorkSpaces\Ampz\DataSet\t_ampz_address_dataset.json

BEGIN
    export_t_ampz_address;
END;
/

SPOOL OFF;

CREATE OR REPLACE PROCEDURE export_t_ampz_user IS
    -- Variável para armazenar os dados JSON
    v_json_data  CLOB;
    v_json_table CLOB;
    v_file_name  VARCHAR2(100);
BEGIN
    v_file_name := 't_ampz_user_dataset.json';
    v_json_table := '[';
    FOR rec IN (
        SELECT
            id_user,
            ds_name,
            ds_email,
            ds_password,
            id_address,
            to_char(dt_birthdate, 'YYYY-MM-DD') AS dt_birthdate
        FROM
            t_ampz_user
    ) LOOP
        v_json_data :=
            JSON_OBJECT(
                'id_user' VALUE rec.id_user,
                'ds_name' VALUE rec.ds_name,
                'ds_email' VALUE rec.ds_email,
                'ds_password' VALUE rec.ds_password,
                'id_address' VALUE rec.id_address,
                        'dt_birthdate' VALUE rec.dt_birthdate
            );

        v_json_table := v_json_table
                        || v_json_data
                        || ',';
    END LOOP;

    v_json_table := rtrim(v_json_table, ',')
                    || ']';
    dbms_output.put_line(v_json_table);
END export_t_ampz_user;
/

SET SERVEROUTPUT ON SIZE UNLIMITED;
SET FEEDBACK OFF;
SET TERMOUT OFF;

SPOOL C:\WorkSpaces\Ampz\DataSet\t_ampz_user_dataset.json

BEGIN
    export_t_ampz_user;
END;
/

SPOOL OFF;

CREATE OR REPLACE PROCEDURE export_t_ampz_device IS
    v_json_data    CLOB;
    v_json_table   CLOB;
    v_first_record BOOLEAN := TRUE;
BEGIN
    v_json_table := '[';
    FOR rec IN (
        SELECT
            id_device,
            id_kid,
            ds_name,
            ds_type,
            ds_operating_system,
            vl_energy_consumption,
            vl_energy_saved
        FROM
            t_ampz_device
    ) LOOP
        IF NOT v_first_record THEN
            v_json_table := v_json_table || ',';
        END IF;
        v_first_record := FALSE;
        v_json_data := '{"id_device": '
                       || rec.id_device
                       || ','
                       || '"id_kid": '
                       || rec.id_kid
                       || ','
                       || '"ds_name": '
                       || '"'
                       || replace(rec.ds_name, '"', '\"')
                       || '",'
                       || '"ds_type": '
                       || '"'
                       || replace(rec.ds_type, '"', '\"')
                       || '",'
                       || '"ds_operating_system": '
                       || '"'
                       || replace(rec.ds_operating_system, '"', '\"')
                       || '",'
                       || '"vl_energy_consumption": '
                       || rec.vl_energy_consumption
                       || ','
                       || '"vl_energy_saved": '
                       || rec.vl_energy_saved
                       || '}';

        v_json_table := v_json_table || v_json_data;
    END LOOP;

    v_json_table := v_json_table || ']';
    dbms_output.put_line(v_json_table);
END export_t_ampz_device;
/

SET SERVEROUTPUT ON SIZE UNLIMITED;
SET FEEDBACK OFF;
SET TERMOUT OFF;

SPOOL C:\WorkSpaces\Ampz\DataSet\t_ampz_device_dataset.json

BEGIN
    export_t_ampz_device;
END;
/

SPOOL OFF;

CREATE OR REPLACE PROCEDURE export_t_ampz_kid IS
    v_json_data    CLOB;
    v_json_table   CLOB;
    v_first_record BOOLEAN := TRUE;
BEGIN
    v_json_table := '[';
    FOR rec IN (
        SELECT
            id_kid,
            id_user,
            ds_name,
            dt_birthdate,
            total_score,
            total_energy_saved
        FROM
            t_ampz_kid
    ) LOOP
        IF NOT v_first_record THEN
            v_json_table := v_json_table || ',';
        END IF;
        v_first_record := FALSE;
        v_json_data := '{"id_kid": '
                       || rec.id_kid
                       || ','
                       || '"id_user": '
                       || rec.id_user
                       || ','
                       || '"ds_name": '
                       || '"'
                       || replace(rec.ds_name, '"', '\"')
                       || '",'
                       || '"dt_birthdate": '
                       || '"'
                       || to_char(rec.dt_birthdate, 'YYYY-MM-DD')
                       || '",'
                       || '"total_score": '
                       || rec.total_score
                       || ','
                       || '"total_energy_saved": '
                       || rec.total_energy_saved
                       || '}';

        v_json_table := v_json_table || v_json_data;
    END LOOP;

    v_json_table := v_json_table || ']';
    dbms_output.put_line(v_json_table);
END export_t_ampz_kid;
/

SET SERVEROUTPUT ON SIZE UNLIMITED;
SET FEEDBACK OFF;
SET TERMOUT OFF;

SPOOL C:\WorkSpaces\Ampz\DataSet\t_ampz_kid_dataset.json

BEGIN
    export_t_ampz_kid;
END;
/

SPOOL OFF;

CREATE OR REPLACE PROCEDURE export_t_ampz_community IS
    v_json_data    CLOB;
    v_json_table   CLOB;
    v_first_record BOOLEAN := TRUE;
BEGIN
    v_json_table := '[';
    FOR rec IN (
        SELECT
            id_community,
            ds_name,
            nvl(ds_description, 'null') AS ds_description,
            total_points
        FROM
            t_ampz_community
    ) LOOP
        IF NOT v_first_record THEN
            v_json_table := v_json_table || ',';
        END IF;
        v_first_record := FALSE;
        v_json_data := '{"id_community": '
                       || rec.id_community
                       || ','
                       || '"ds_name": '
                       || '"'
                       || replace(rec.ds_name, '"', '\"')
                       || '",'
                       || '"ds_description": '
                       ||
            CASE
                WHEN rec.ds_description = 'null' THEN
                    'null'
                ELSE '"'
                     || replace(rec.ds_description, '"', '\"')
                     || '"'
            END
                       || ','
                       || '"total_points": '
                       || rec.total_points
                       || '}';

        v_json_table := v_json_table || v_json_data;
    END LOOP;

    v_json_table := v_json_table || ']';
    dbms_output.put_line(v_json_table);
END export_t_ampz_community;
/

SET SERVEROUTPUT ON SIZE UNLIMITED;
SET FEEDBACK OFF;
SET TERMOUT OFF;

SPOOL C:\WorkSpaces\Ampz\DataSet\t_ampz_community_dataset.json

BEGIN
    export_t_ampz_community;
END;
/

SPOOL OFF;

CREATE OR REPLACE PROCEDURE export_t_ampz_community_participation IS
    v_json_data    CLOB;
    v_json_table   CLOB;
    v_first_record BOOLEAN := TRUE;
BEGIN
    v_json_table := '[';
    FOR rec IN (
        SELECT
            id_participation,
            id_kid,
            id_community,
            points
        FROM
            t_ampz_community_participation
    ) LOOP
        IF NOT v_first_record THEN
            v_json_table := v_json_table || ',';
        END IF;
        v_first_record := FALSE;
        v_json_data := '{"id_participation": '
                       || rec.id_participation
                       || ','
                       || '"id_kid": '
                       || rec.id_kid
                       || ','
                       || '"id_community": '
                       || rec.id_community
                       || ','
                       || '"points": '
                       || rec.points
                       || '}';

        v_json_table := v_json_table || v_json_data;
    END LOOP;

    v_json_table := v_json_table || ']';
    dbms_output.put_line(v_json_table);
END export_t_ampz_community_participation;
/

SET SERVEROUTPUT ON SIZE UNLIMITED;
SET FEEDBACK OFF;
SET TERMOUT OFF;

SPOOL C:\WorkSpaces\Ampz\DataSet\t_ampz_community_participation_dataset.json

BEGIN
    export_t_ampz_community_participation;
END;
/

SPOOL OFF;

CREATE OR REPLACE PROCEDURE export_t_ampz_challenge_goal IS
    v_json_data    CLOB;
    v_json_table   CLOB;
    v_first_record BOOLEAN := TRUE;
BEGIN
    v_json_table := '[';
    FOR rec IN (
        SELECT
            id_challenge,
            ds_description,
            vl_score,
            dt_start,
            dt_end,
            vl_energy_required,
            id_community
        FROM
            t_ampz_challenge_goal
    ) LOOP
        IF NOT v_first_record THEN
            v_json_table := v_json_table || ',';
        END IF;
        v_first_record := FALSE;
        v_json_data := '{"id_challenge": '
                       || rec.id_challenge
                       || ','
                       || '"ds_description": '
                       || '"'
                       || replace(rec.ds_description, '"', '\"')
                       || '",'
                       || '"vl_score": '
                       || rec.vl_score
                       || ','
                       || '"dt_start": '
                       || '"'
                       || to_char(rec.dt_start, 'YYYY-MM-DD"T"HH24:MI:SS')
                       || '",'
                       || '"dt_end": '
                       || '"'
                       || to_char(rec.dt_end, 'YYYY-MM-DD"T"HH24:MI:SS')
                       || '",'
                       || '"vl_energy_required": '
                       || rec.vl_energy_required
                       || ','
                       || '"id_community": '
                       || rec.id_community
                       || '}';

        v_json_table := v_json_table || v_json_data;
    END LOOP;

    v_json_table := v_json_table || ']';
    dbms_output.put_line(v_json_table);
END export_t_ampz_challenge_goal;
/

SET SERVEROUTPUT ON SIZE UNLIMITED;
SET FEEDBACK OFF;
SET TERMOUT OFF;

SPOOL C:\WorkSpaces\Ampz\DataSet\t_ampz_challenge_goal_dataset.json

BEGIN
    export_t_ampz_challenge_goal;
END;
/

SPOOL OFF;

CREATE OR REPLACE PROCEDURE export_t_ampz_energy_consumption IS
    v_json_data    CLOB;
    v_json_table   CLOB;
    v_first_record BOOLEAN := TRUE;
BEGIN
    v_json_table := '[';
    FOR rec IN (
        SELECT
            id_energy_consumption,
            id_device,
            ds_consumption_type,
            vl_consumption,
            vl_energy_saved,
            to_char(dt_consumption, 'YYYY-MM-DD') AS dt_consumption
        FROM
            t_ampz_energy_consumption
    ) LOOP
        IF NOT v_first_record THEN
            v_json_table := v_json_table || ',';
        END IF;
        v_first_record := FALSE;
        v_json_data := '{"id_energy_consumption": '
                       || rec.id_energy_consumption
                       || ','
                       || '"id_device": '
                       || rec.id_device
                       || ','
                       || '"ds_consumption_type": '
                       || '"'
                       || replace(rec.ds_consumption_type, '"', '\"')
                       || '",'
                       || '"vl_consumption": '
                       || rec.vl_consumption
                       || ','
                       || '"vl_energy_saved": '
                       || rec.vl_energy_saved
                       || ','
                       || '"dt_consumption": '
                       || '"'
                       || rec.dt_consumption
                       || '"}';

        v_json_table := v_json_table || v_json_data;
    END LOOP;

    v_json_table := v_json_table || ']';
    dbms_output.put_line(v_json_table);
END export_t_ampz_energy_consumption;
/

SET SERVEROUTPUT ON SIZE UNLIMITED;
SET FEEDBACK OFF;
SET TERMOUT OFF;

SPOOL C:\WorkSpaces\Ampz\DataSet\t_ampz_energy_consumption_dataset.json

BEGIN
    export_t_ampz_energy_consumption;
END;
/

SPOOL OFF;

CREATE OR REPLACE PROCEDURE export_t_ampz_score IS
    v_json_data    CLOB;
    v_json_table   CLOB;
    v_first_record BOOLEAN := TRUE;
BEGIN
    v_json_table := '[';
    FOR rec IN (
        SELECT
            id_score,
            id_kid,
            id_challenge,
            vl_points,
            dt_completion
        FROM
            t_ampz_score
    ) LOOP
        IF NOT v_first_record THEN
            v_json_table := v_json_table || ',';
        END IF;
        v_first_record := FALSE;
        v_json_data := '{"id_score": '
                       || rec.id_score
                       || ','
                       || '"id_kid": '
                       || rec.id_kid
                       || ','
                       || '"id_challenge": '
                       || rec.id_challenge
                       || ','
                       || '"vl_points": '
                       || rec.vl_points
                       || ','
                       || '"dt_completion": "'
                       || to_char(rec.dt_completion, 'YYYY-MM-DD"T"HH24:MI:SS')
                       || '"}';

        v_json_table := v_json_table || v_json_data;
    END LOOP;

    v_json_table := v_json_table || ']';
    dbms_output.put_line(v_json_table);
END export_t_ampz_score;
/

SET SERVEROUTPUT ON SIZE UNLIMITED;
SET FEEDBACK OFF;
SET TERMOUT OFF;

SPOOL C:\WorkSpaces\Ampz\DataSet\t_ampz_score.json

BEGIN
    export_t_ampz_score;
END;
/

SPOOL OFF;