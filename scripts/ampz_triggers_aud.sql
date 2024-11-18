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

-- Trigger para auditoria de endereços
CREATE OR REPLACE TRIGGER trg_audit_address
AFTER INSERT OR UPDATE OR DELETE ON t_gxp_address
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO t_audit_gxp_address (audit_id, id_address, operation, operation_date, new_street, new_number)
        VALUES (seq_t_audit_gxp_address.NEXTVAL, :NEW.id_address, 'INSERT', SYSTIMESTAMP, :NEW.ds_street, :NEW.ds_number);
    ELSIF UPDATING THEN
        INSERT INTO t_audit_gxp_address (audit_id, id_address, operation, operation_date, old_street, old_number, new_street, new_number)
        VALUES (seq_t_audit_gxp_address.NEXTVAL, :OLD.id_address, 'UPDATE', SYSTIMESTAMP, :OLD.ds_street, :OLD.ds_number, :NEW.ds_street, :NEW.ds_number);
    ELSIF DELETING THEN
        INSERT INTO t_audit_gxp_address (audit_id, id_address, operation, operation_date, old_street, old_number)
        VALUES (seq_t_audit_gxp_address.NEXTVAL, :OLD.id_address, 'DELETE', SYSTIMESTAMP, :OLD.ds_street, :OLD.ds_number);
    END IF;
END;
/

-- Trigger para auditoria de usuários
CREATE OR REPLACE TRIGGER trg_audit_user
AFTER INSERT OR UPDATE OR DELETE ON t_gxp_user
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO t_audit_gxp_user (audit_id, id_user, operation, operation_date, new_name, new_email)
        VALUES (seq_t_audit_gxp_user.NEXTVAL, :NEW.id_user, 'INSERT', SYSTIMESTAMP, :NEW.ds_name, :NEW.ds_email);
    ELSIF UPDATING THEN
        INSERT INTO t_audit_gxp_user (audit_id, id_user, operation, operation_date, old_name, old_email, new_name, new_email)
        VALUES (seq_t_audit_gxp_user.NEXTVAL, :OLD.id_user, 'UPDATE', SYSTIMESTAMP, :OLD.ds_name, :OLD.ds_email, :NEW.ds_name, :NEW.ds_email);
    ELSIF DELETING THEN
        INSERT INTO t_audit_gxp_user (audit_id, id_user, operation, operation_date, old_name, old_email)
        VALUES (seq_t_audit_gxp_user.NEXTVAL, :OLD.id_user, 'DELETE', SYSTIMESTAMP, :OLD.ds_name, :OLD.ds_email);
    END IF;
END;
/

-- Trigger para auditoria de crianças
CREATE OR REPLACE TRIGGER trg_audit_kid
AFTER INSERT OR UPDATE OR DELETE ON t_gxp_kid
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO t_audit_gxp_kid (audit_id, id_kid, operation, operation_date, new_name, new_total_score)
        VALUES (seq_t_audit_gxp_kid.NEXTVAL, :NEW.id_kid, 'INSERT', SYSTIMESTAMP, :NEW.ds_name, :NEW.total_score);
    ELSIF UPDATING THEN
        INSERT INTO t_audit_gxp_kid (audit_id, id_kid, operation, operation_date, old_name, old_total_score, new_name, new_total_score)
        VALUES (seq_t_audit_gxp_kid.NEXTVAL, :OLD.id_kid, 'UPDATE', SYSTIMESTAMP, :OLD.ds_name, :OLD.total_score, :NEW.ds_name, :NEW.total_score);
    ELSIF DELETING THEN
        INSERT INTO t_audit_gxp_kid (audit_id, id_kid, operation, operation_date, old_name, old_total_score)
        VALUES (seq_t_audit_gxp_kid.NEXTVAL, :OLD.id_kid, 'DELETE', SYSTIMESTAMP, :OLD.ds_name, :OLD.total_score);
    END IF;
END;
/

-- Trigger para auditoria de dispositivos
CREATE OR REPLACE TRIGGER trg_audit_device
AFTER INSERT OR UPDATE OR DELETE ON t_gxp_device
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO t_audit_gxp_device (audit_id, id_device, operation, operation_date, new_name, new_energy_consumption)
        VALUES (seq_t_audit_gxp_device.NEXTVAL, :NEW.id_device, 'INSERT', SYSTIMESTAMP, :NEW.ds_name, :NEW.vl_energy_consumption);
    ELSIF UPDATING THEN
        INSERT INTO t_audit_gxp_device (audit_id, id_device, operation, operation_date, old_name, old_energy_consumption, new_name, new_energy_consumption)
        VALUES (seq_t_audit_gxp_device.NEXTVAL, :OLD.id_device, 'UPDATE', SYSTIMESTAMP, :OLD.ds_name, :OLD.vl_energy_consumption, :NEW.ds_name, :NEW.vl_energy_consumption);
    ELSIF DELETING THEN
        INSERT INTO t_audit_gxp_device (audit_id, id_device, operation, operation_date, old_name, old_energy_consumption)
        VALUES (seq_t_audit_gxp_device.NEXTVAL, :OLD.id_device, 'DELETE', SYSTIMESTAMP, :OLD.ds_name, :OLD.vl_energy_consumption);
    END IF;
END;
/

-- Trigger para auditoria de comunidades
CREATE OR REPLACE TRIGGER trg_audit_community
AFTER INSERT OR UPDATE OR DELETE ON t_gxp_community
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO t_audit_gxp_community (audit_id, id_community, operation, operation_date, new_name, new_total_points)
        VALUES (seq_t_audit_gxp_community.NEXTVAL, :NEW.id_community, 'INSERT', SYSTIMESTAMP, :NEW.ds_name, :NEW.total_points);
    ELSIF UPDATING THEN
        INSERT INTO t_audit_gxp_community (audit_id, id_community, operation, operation_date, old_name, old_total_points, new_name, new_total_points)
        VALUES (seq_t_audit_gxp_community.NEXTVAL, :OLD.id_community, 'UPDATE', SYSTIMESTAMP, :OLD.ds_name, :OLD.total_points, :NEW.ds_name, :NEW.total_points);
    ELSIF DELETING THEN
        INSERT INTO t_audit_gxp_community (audit_id, id_community, operation, operation_date, old_name, old_total_points)
        VALUES (seq_t_audit_gxp_community.NEXTVAL, :OLD.id_community, 'DELETE', SYSTIMESTAMP, :OLD.ds_name, :OLD.total_points);
    END IF;
END;
/

-- Trigger para auditoria de participação em comunidades
CREATE OR REPLACE TRIGGER trg_audit_community_participation
AFTER INSERT OR UPDATE OR DELETE ON t_gxp_community_participation
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO t_audit_gxp_community_participation (audit_id, id_participation, id_kid, id_community, operation, operation_date, new_points)
        VALUES (seq_t_audit_gxp_community_participation.NEXTVAL, :NEW.id_participation, :NEW.id_kid, :NEW.id_community, 'INSERT', SYSTIMESTAMP, :NEW.points);
    ELSIF UPDATING THEN
        INSERT INTO t_audit_gxp_community_participation (audit_id, id_participation, id_kid, id_community, operation, operation_date, old_points, new_points)
        VALUES (seq_t_audit_gxp_community_participation.NEXTVAL, :OLD.id_participation, :OLD.id_kid, :OLD.id_community, 'UPDATE', SYSTIMESTAMP, :OLD.points, :NEW.points);
    ELSIF DELETING THEN
        INSERT INTO t_audit_gxp_community_participation (audit_id, id_participation, id_kid, id_community, operation, operation_date, old_points)
        VALUES (seq_t_audit_gxp_community_participation.NEXTVAL, :OLD.id_participation, :OLD.id_kid, :OLD.id_community, 'DELETE', SYSTIMESTAMP, :OLD.points);
    END IF;
END;
/

-- Trigger para auditoria de metas de desafios
CREATE OR REPLACE TRIGGER trg_audit_challenge_goal
AFTER INSERT OR UPDATE OR DELETE ON t_gxp_challenge_goal
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO t_audit_gxp_challenge_goal (audit_id, id_challenge, id_community, operation, operation_date, new_description, new_score)
        VALUES (seq_t_audit_gxp_challenge_goal.NEXTVAL, :NEW.id_challenge, :NEW.id_community, 'INSERT', SYSTIMESTAMP, :NEW.ds_description, :NEW.vl_score);
    ELSIF UPDATING THEN
        INSERT INTO t_audit_gxp_challenge_goal (audit_id, id_challenge, id_community, operation, operation_date, old_description, old_score, new_description, new_score)
        VALUES (seq_t_audit_gxp_challenge_goal.NEXTVAL, :OLD.id_challenge, :OLD.id_community, 'UPDATE', SYSTIMESTAMP, :OLD.ds_description, :OLD.vl_score, :NEW.ds_description, :NEW.vl_score);
    ELSIF DELETING THEN
        INSERT INTO t_audit_gxp_challenge_goal (audit_id, id_challenge, id_community, operation, operation_date, old_description, old_score)
        VALUES (seq_t_audit_gxp_challenge_goal.NEXTVAL, :OLD.id_challenge, :OLD.id_community, 'DELETE', SYSTIMESTAMP, :OLD.ds_description, :OLD.vl_score);
    END IF;
END;
/

-- Trigger para auditoria de consumo de energia
CREATE OR REPLACE TRIGGER trg_audit_energy_consumption
AFTER INSERT OR UPDATE OR DELETE ON t_gxp_energy_consumption
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO t_audit_gxp_energy_consumption (audit_id, id_energy_consumption, id_device, operation, operation_date, new_consumption_type, new_energy_saved)
        VALUES (seq_t_audit_gxp_energy_consumption.NEXTVAL, :NEW.id_energy_consumption, :NEW.id_device, 'INSERT', SYSTIMESTAMP, :NEW.ds_consumption_type, :NEW.vl_energy_saved);
    ELSIF UPDATING THEN
        INSERT INTO t_audit_gxp_energy_consumption (audit_id, id_energy_consumption, id_device, operation, operation_date, old_consumption_type, old_energy_saved, new_consumption_type, new_energy_saved)
        VALUES (seq_t_audit_gxp_energy_consumption.NEXTVAL, :OLD.id_energy_consumption, :OLD.id_device, 'UPDATE', SYSTIMESTAMP, :OLD.ds_consumption_type, :OLD.vl_energy_saved, :NEW.ds_consumption_type, :NEW.vl_energy_saved);
    ELSIF DELETING THEN
        INSERT INTO t_audit_gxp_energy_consumption (audit_id, id_energy_consumption, id_device, operation, operation_date, old_consumption_type, old_energy_saved)
        VALUES (seq_t_audit_gxp_energy_consumption.NEXTVAL, :OLD.id_energy_consumption, :OLD.id_device, 'DELETE', SYSTIMESTAMP, :OLD.ds_consumption_type, :OLD.vl_energy_saved);
    END IF;
END;
/

-- Trigger para auditoria de pontuação
CREATE OR REPLACE TRIGGER trg_audit_score
AFTER INSERT OR UPDATE OR DELETE ON t_gxp_score
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO t_audit_gxp_score (audit_id, id_score, id_kid, id_challenge, operation, operation_date, new_points)
        VALUES (seq_t_audit_gxp_score.NEXTVAL, :NEW.id_score, :NEW.id_kid, :NEW.id_challenge, 'INSERT', SYSTIMESTAMP, :NEW.vl_points);
    ELSIF UPDATING THEN
        INSERT INTO t_audit_gxp_score (audit_id, id_score, id_kid, id_challenge, operation, operation_date, old_points, new_points)
        VALUES (seq_t_audit_gxp_score.NEXTVAL, :OLD.id_score, :OLD.id_kid, :OLD.id_challenge, 'UPDATE', SYSTIMESTAMP, :OLD.vl_points, :NEW.vl_points);
    ELSIF DELETING THEN
        INSERT INTO t_audit_gxp_score (audit_id, id_score, id_kid, id_challenge, operation, operation_date, old_points)
        VALUES (seq_t_audit_gxp_score.NEXTVAL, :OLD.id_score, :OLD.id_kid, :OLD.id_challenge, 'DELETE', SYSTIMESTAMP, :OLD.vl_points);
    END IF;
END;
/