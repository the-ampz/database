---- DROP TRIGGERS
--DROP TRIGGER trg_audit_score;
--DROP TRIGGER trg_audit_energy_consumption;
--DROP TRIGGER trg_audit_challenge_goal;
--DROP TRIGGER trg_audit_community_participation;
--DROP TRIGGER trg_audit_community;
--DROP TRIGGER trg_audit_device;
--DROP TRIGGER trg_audit_kid;
--DROP TRIGGER trg_audit_user;
--DROP TRIGGER trg_audit_address;


CREATE OR REPLACE TRIGGER trg_audit_address AFTER
    INSERT OR UPDATE OR DELETE ON t_ampz_address
    FOR EACH ROW
BEGIN
    IF inserting THEN
        INSERT INTO t_audit_ampz_address (
            audit_id,
            id_address,
            operation,
            operation_date,
            new_street,
            new_number
        ) VALUES (
            seq_t_audit_ampz_address.NEXTVAL,
            :new.id_address,
            'INSERT',
            systimestamp,
            :new.ds_street,
            :new.ds_number
        );

    ELSIF updating THEN
        INSERT INTO t_audit_ampz_address (
            audit_id,
            id_address,
            operation,
            operation_date,
            old_street,
            old_number,
            new_street,
            new_number
        ) VALUES (
            seq_t_audit_ampz_address.NEXTVAL,
            :old.id_address,
            'UPDATE',
            systimestamp,
            :old.ds_street,
            :old.ds_number,
            :new.ds_street,
            :new.ds_number
        );

    ELSIF deleting THEN
        INSERT INTO t_audit_ampz_address (
            audit_id,
            id_address,
            operation,
            operation_date,
            old_street,
            old_number
        ) VALUES (
            seq_t_audit_ampz_address.NEXTVAL,
            :old.id_address,
            'DELETE',
            systimestamp,
            :old.ds_street,
            :old.ds_number
        );

    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_audit_user AFTER
    INSERT OR UPDATE OR DELETE ON t_ampz_user
    FOR EACH ROW
BEGIN
    IF inserting THEN
        INSERT INTO t_audit_ampz_user (
            audit_id,
            id_user,
            operation,
            operation_date,
            new_name,
            new_email
        ) VALUES (
            seq_t_audit_ampz_user.NEXTVAL,
            :new.id_user,
            'INSERT',
            systimestamp,
            :new.ds_name,
            :new.ds_email
        );

    ELSIF updating THEN
        INSERT INTO t_audit_ampz_user (
            audit_id,
            id_user,
            operation,
            operation_date,
            old_name,
            old_email,
            new_name,
            new_email
        ) VALUES (
            seq_t_audit_ampz_user.NEXTVAL,
            :old.id_user,
            'UPDATE',
            systimestamp,
            :old.ds_name,
            :old.ds_email,
            :new.ds_name,
            :new.ds_email
        );

    ELSIF deleting THEN
        INSERT INTO t_audit_ampz_user (
            audit_id,
            id_user,
            operation,
            operation_date,
            old_name,
            old_email
        ) VALUES (
            seq_t_audit_ampz_user.NEXTVAL,
            :old.id_user,
            'DELETE',
            systimestamp,
            :old.ds_name,
            :old.ds_email
        );

    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_audit_kid AFTER
    INSERT OR UPDATE OR DELETE ON t_ampz_kid
    FOR EACH ROW
BEGIN
    IF inserting THEN
        INSERT INTO t_audit_ampz_kid (
            audit_id,
            id_kid,
            operation,
            operation_date,
            new_name,
            new_total_score
        ) VALUES (
            seq_t_audit_ampz_kid.NEXTVAL,
            :new.id_kid,
            'INSERT',
            systimestamp,
            :new.ds_name,
            :new.total_score
        );

    ELSIF updating THEN
        INSERT INTO t_audit_ampz_kid (
            audit_id,
            id_kid,
            operation,
            operation_date,
            old_name,
            old_total_score,
            new_name,
            new_total_score
        ) VALUES (
            seq_t_audit_ampz_kid.NEXTVAL,
            :old.id_kid,
            'UPDATE',
            systimestamp,
            :old.ds_name,
            :old.total_score,
            :new.ds_name,
            :new.total_score
        );

    ELSIF deleting THEN
        INSERT INTO t_audit_ampz_kid (
            audit_id,
            id_kid,
            operation,
            operation_date,
            old_name,
            old_total_score
        ) VALUES (
            seq_t_audit_ampz_kid.NEXTVAL,
            :old.id_kid,
            'DELETE',
            systimestamp,
            :old.ds_name,
            :old.total_score
        );

    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_audit_device AFTER
    INSERT OR UPDATE OR DELETE ON t_ampz_device
    FOR EACH ROW
BEGIN
    IF inserting THEN
        INSERT INTO t_audit_ampz_device (
            audit_id,
            id_device,
            operation,
            operation_date,
            new_name,
            new_energy_consumption
        ) VALUES (
            seq_t_audit_ampz_device.NEXTVAL,
            :new.id_device,
            'INSERT',
            systimestamp,
            :new.ds_name,
            :new.vl_energy_consumption
        );

    ELSIF updating THEN
        INSERT INTO t_audit_ampz_device (
            audit_id,
            id_device,
            operation,
            operation_date,
            old_name,
            old_energy_consumption,
            new_name,
            new_energy_consumption
        ) VALUES (
            seq_t_audit_ampz_device.NEXTVAL,
            :old.id_device,
            'UPDATE',
            systimestamp,
            :old.ds_name,
            :old.vl_energy_consumption,
            :new.ds_name,
            :new.vl_energy_consumption
        );

    ELSIF deleting THEN
        INSERT INTO t_audit_ampz_device (
            audit_id,
            id_device,
            operation,
            operation_date,
            old_name,
            old_energy_consumption
        ) VALUES (
            seq_t_audit_ampz_device.NEXTVAL,
            :old.id_device,
            'DELETE',
            systimestamp,
            :old.ds_name,
            :old.vl_energy_consumption
        );

    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_audit_community AFTER
    INSERT OR UPDATE OR DELETE ON t_ampz_community
    FOR EACH ROW
BEGIN
    IF inserting THEN
        INSERT INTO t_audit_ampz_community (
            audit_id,
            id_community,
            operation,
            operation_date,
            new_name,
            new_total_points
        ) VALUES (
            seq_t_audit_ampz_community.NEXTVAL,
            :new.id_community,
            'INSERT',
            systimestamp,
            :new.ds_name,
            :new.total_points
        );

    ELSIF updating THEN
        INSERT INTO t_audit_ampz_community (
            audit_id,
            id_community,
            operation,
            operation_date,
            old_name,
            old_total_points,
            new_name,
            new_total_points
        ) VALUES (
            seq_t_audit_ampz_community.NEXTVAL,
            :old.id_community,
            'UPDATE',
            systimestamp,
            :old.ds_name,
            :old.total_points,
            :new.ds_name,
            :new.total_points
        );

    ELSIF deleting THEN
        INSERT INTO t_audit_ampz_community (
            audit_id,
            id_community,
            operation,
            operation_date,
            old_name,
            old_total_points
        ) VALUES (
            seq_t_audit_ampz_community.NEXTVAL,
            :old.id_community,
            'DELETE',
            systimestamp,
            :old.ds_name,
            :old.total_points
        );

    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_audit_community_participation AFTER
    INSERT OR UPDATE OR DELETE ON t_ampz_community_participation
    FOR EACH ROW
BEGIN
    IF inserting THEN
        INSERT INTO t_audit_ampz_community_participation (
            audit_id,
            id_participation,
            id_kid,
            id_community,
            operation,
            operation_date,
            new_points
        ) VALUES (
            seq_t_audit_ampz_community_participation.NEXTVAL,
            :new.id_participation,
            :new.id_kid,
            :new.id_community,
            'INSERT',
            systimestamp,
            :new.points
        );

    ELSIF updating THEN
        INSERT INTO t_audit_ampz_community_participation (
            audit_id,
            id_participation,
            id_kid,
            id_community,
            operation,
            operation_date,
            old_points,
            new_points
        ) VALUES (
            seq_t_audit_ampz_community_participation.NEXTVAL,
            :old.id_participation,
            :old.id_kid,
            :old.id_community,
            'UPDATE',
            systimestamp,
            :old.points,
            :new.points
        );

    ELSIF deleting THEN
        INSERT INTO t_audit_ampz_community_participation (
            audit_id,
            id_participation,
            id_kid,
            id_community,
            operation,
            operation_date,
            old_points
        ) VALUES (
            seq_t_audit_ampz_community_participation.NEXTVAL,
            :old.id_participation,
            :old.id_kid,
            :old.id_community,
            'DELETE',
            systimestamp,
            :old.points
        );

    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_audit_challenge_goal AFTER
    INSERT OR UPDATE OR DELETE ON t_ampz_challenge_goal
    FOR EACH ROW
BEGIN
    IF inserting THEN
        INSERT INTO t_audit_ampz_challenge_goal (
            audit_id,
            id_challenge,
            id_community,
            operation,
            operation_date,
            new_description,
            new_score
        ) VALUES (
            seq_t_audit_ampz_challenge_goal.NEXTVAL,
            :new.id_challenge,
            :new.id_community,
            'INSERT',
            systimestamp,
            :new.ds_description,
            :new.vl_score
        );

    ELSIF updating THEN
        INSERT INTO t_audit_ampz_challenge_goal (
            audit_id,
            id_challenge,
            id_community,
            operation,
            operation_date,
            old_description,
            old_score,
            new_description,
            new_score
        ) VALUES (
            seq_t_audit_ampz_challenge_goal.NEXTVAL,
            :old.id_challenge,
            :old.id_community,
            'UPDATE',
            systimestamp,
            :old.ds_description,
            :old.vl_score,
            :new.ds_description,
            :new.vl_score
        );

    ELSIF deleting THEN
        INSERT INTO t_audit_ampz_challenge_goal (
            audit_id,
            id_challenge,
            id_community,
            operation,
            operation_date,
            old_description,
            old_score
        ) VALUES (
            seq_t_audit_ampz_challenge_goal.NEXTVAL,
            :old.id_challenge,
            :old.id_community,
            'DELETE',
            systimestamp,
            :old.ds_description,
            :old.vl_score
        );

    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_audit_energy_consumption AFTER
    INSERT OR UPDATE OR DELETE ON t_ampz_energy_consumption
    FOR EACH ROW
BEGIN
    IF inserting THEN
        INSERT INTO t_audit_ampz_energy_consumption (
            audit_id,
            id_energy_consumption,
            id_device,
            operation,
            operation_date,
            new_consumption_type,
            new_energy_saved
        ) VALUES (
            seq_t_audit_ampz_energy_consumption.NEXTVAL,
            :new.id_energy_consumption,
            :new.id_device,
            'INSERT',
            systimestamp,
            :new.ds_consumption_type,
            :new.vl_energy_saved
        );

    ELSIF updating THEN
        INSERT INTO t_audit_ampz_energy_consumption (
            audit_id,
            id_energy_consumption,
            id_device,
            operation,
            operation_date,
            old_consumption_type,
            old_energy_saved,
            new_consumption_type,
            new_energy_saved
        ) VALUES (
            seq_t_audit_ampz_energy_consumption.NEXTVAL,
            :old.id_energy_consumption,
            :old.id_device,
            'UPDATE',
            systimestamp,
            :old.ds_consumption_type,
            :old.vl_energy_saved,
            :new.ds_consumption_type,
            :new.vl_energy_saved
        );

    ELSIF deleting THEN
        INSERT INTO t_audit_ampz_energy_consumption (
            audit_id,
            id_energy_consumption,
            id_device,
            operation,
            operation_date,
            old_consumption_type,
            old_energy_saved
        ) VALUES (
            seq_t_audit_ampz_energy_consumption.NEXTVAL,
            :old.id_energy_consumption,
            :old.id_device,
            'DELETE',
            systimestamp,
            :old.ds_consumption_type,
            :old.vl_energy_saved
        );

    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_audit_score AFTER
    INSERT OR UPDATE OR DELETE ON t_ampz_score
    FOR EACH ROW
BEGIN
    IF inserting THEN
        INSERT INTO t_audit_ampz_score (
            audit_id,
            id_score,
            id_kid,
            id_challenge,
            operation,
            operation_date,
            new_points
        ) VALUES (
            seq_t_audit_ampz_score.NEXTVAL,
            :new.id_score,
            :new.id_kid,
            :new.id_challenge,
            'INSERT',
            systimestamp,
            :new.vl_points
        );

    ELSIF updating THEN
        INSERT INTO t_audit_ampz_score (
            audit_id,
            id_score,
            id_kid,
            id_challenge,
            operation,
            operation_date,
            old_points,
            new_points
        ) VALUES (
            seq_t_audit_ampz_score.NEXTVAL,
            :old.id_score,
            :old.id_kid,
            :old.id_challenge,
            'UPDATE',
            systimestamp,
            :old.vl_points,
            :new.vl_points
        );

    ELSIF deleting THEN
        INSERT INTO t_audit_ampz_score (
            audit_id,
            id_score,
            id_kid,
            id_challenge,
            operation,
            operation_date,
            old_points
        ) VALUES (
            seq_t_audit_ampz_score.NEXTVAL,
            :old.id_score,
            :old.id_kid,
            :old.id_challenge,
            'DELETE',
            systimestamp,
            :old.vl_points
        );

    END IF;
END;
/