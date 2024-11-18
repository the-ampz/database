-- Fun��es para Gerenciamento de Crian�as e Dispositivos

-- Fun��o 1: Calcular a Idade de uma Crian�a
CREATE OR REPLACE FUNCTION fn_calcular_idade(
    p_birthdate IN DATE
) RETURN NUMBER IS
    v_idade NUMBER;
BEGIN
    SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, p_birthdate)) INTO v_idade FROM dual;
    RETURN v_idade;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao calcular a idade.');
        RETURN NULL;
END fn_calcular_idade;

-- Fun��o 2: Validar Consumo de Energia
CREATE OR REPLACE FUNCTION fn_validar_consumo_energia(
    p_consumo IN NUMBER
) RETURN VARCHAR2 IS
BEGIN
    IF p_consumo < 0 THEN
        RETURN 'Consumo inv�lido: negativo';
    ELSIF p_consumo > 500 THEN
        RETURN 'Consumo excessivo';
    ELSE
        RETURN 'Consumo aceit�vel';
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro na valida��o do consumo.');
        RETURN 'Erro';
END fn_validar_consumo_energia;

-- Fun��o 3: Validar Formato de Data de Nascimento
CREATE OR REPLACE FUNCTION fn_validar_data_nascimento(
    p_birthdate IN VARCHAR2
) RETURN VARCHAR2 IS
BEGIN
    IF NOT REGEXP_LIKE(p_birthdate, '^\d{4}-\d{2}-\d{2}$') THEN
        RETURN 'Formato de data inv�lido. Use YYYY-MM-DD.';
    END IF;
    RETURN 'Formato de data v�lido.';
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao validar a data de nascimento.');
        RETURN 'Erro';
END fn_validar_data_nascimento;

-- Fun��o 4: Calcular a M�dia de Pontua��o
CREATE OR REPLACE FUNCTION fn_calcular_media_pontuacao(
    p_kid_id IN NUMBER
) RETURN NUMBER IS
    v_media NUMBER;
BEGIN
    SELECT AVG(vl_points) INTO v_media 
    FROM t_gxp_score 
    WHERE id_kid = p_kid_id;

    RETURN NVL(v_media, 0);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Nenhuma pontua��o encontrada.');
        RETURN 0;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao calcular a m�dia.');
        RETURN NULL;
END fn_calcular_media_pontuacao;

-- Fun��o 5: Validar Idade da Crian�a
CREATE OR REPLACE FUNCTION fn_validar_idade(
    p_birthdate IN DATE
) RETURN VARCHAR2 IS
    v_idade NUMBER;
BEGIN
    SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, p_birthdate) / 12) INTO v_idade FROM dual;

    IF v_idade < 5 THEN
        RETURN 'Idade abaixo do limite m�nimo (5 anos)';
    ELSIF v_idade > 12 THEN
        RETURN 'Idade acima do limite m�ximo (12 anos)';
    ELSE
        RETURN 'Idade v�lida';
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao validar a idade.');
        RETURN 'Erro';
END fn_validar_idade;

-- Fun��o 6: Calcular a Economia de Energia
CREATE OR REPLACE FUNCTION fn_calcular_economia_total(
    p_device_id IN NUMBER
) RETURN NUMBER IS
    v_economia_total NUMBER;
    v_count_device NUMBER;
    ex_device_not_found EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO v_count_device FROM t_gxp_device WHERE id_device = p_device_id;

    IF v_count_device = 0 THEN
        RAISE ex_device_not_found;
    END IF;

    SELECT SUM(vl_energy_saved) INTO v_economia_total 
    FROM t_gxp_device 
    WHERE id_device = p_device_id;

    RETURN NVL(v_economia_total, 0);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Nenhuma economia encontrada.');
        RETURN 0;
    WHEN ex_device_not_found THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Dispositivo Inexistente');
        RETURN 0;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Houve um erro inesperado!');
        RETURN 0;
END fn_calcular_economia_total;

-- Fun��o 7: Verificar Participa��o em Comunidade
CREATE OR REPLACE FUNCTION fn_verificar_participacao_community(
    p_kid_id IN NUMBER,
    p_community_id IN NUMBER
) RETURN VARCHAR2 IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count 
    FROM t_gxp_community_participation 
    WHERE id_kid = p_kid_id AND id_community = p_community_id;

    IF v_count > 0 THEN
        RETURN 'Crian�a est� participando da comunidade.';
    ELSE
        RETURN 'Crian�a n�o est� participando da comunidade.';
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao verificar participa��o.');
        RETURN 'Erro';
END fn_verificar_participacao_community;

-- Fun��o 8: Contar Dispositivos de uma Crian�a
CREATE OR REPLACE FUNCTION fn_contar_dispositivos(
    p_kid_id IN NUMBER
) RETURN NUMBER IS
    v_total_dispositivos NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_total_dispositivos 
    FROM t_gxp_device 
    WHERE id_kid = p_kid_id;

    RETURN NVL(v_total_dispositivos, 0);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao contar dispositivos.');
        RETURN NULL;
END fn_contar_dispositivos;

-- Fun��o 9: Validar Pontua��o de um Desafio
CREATE OR REPLACE FUNCTION fn_validar_pontuacao_desafio(
    p_kid_id IN NUMBER,
    p_challenge_id IN NUMBER
) RETURN VARCHAR2 IS
    v_pontuacao NUMBER;
    v_pontuacao_necessaria NUMBER;
BEGIN
    SELECT SUM(vl_points) INTO v_pontuacao 
    FROM t_gxp_score 
    WHERE id_kid = p_kid_id AND id_challenge = p_challenge_id;

    SELECT vl_score INTO v_pontuacao_necessaria 
    FROM t_gxp_challenge_goal 
    WHERE id_challenge = p_challenge_id;

    IF v_pontuacao >= v_pontuacao_necessaria THEN
        RETURN 'Pontua��o necess�ria atingida!';
    ELSE
        RETURN 'Pontua��o necess�ria n�o atingida.';
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Nenhuma pontua��o encontrada.');
        RETURN 'Erro';
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao validar a pontua��o.');
        RETURN 'Erro';
END fn_validar_pontuacao_desafio;

-- Fun��o 10: Calcular Total de Pontos de uma Crian�a
CREATE OR REPLACE FUNCTION fn_calcular_total_pontos(
    p_kid_id IN NUMBER
) RETURN NUMBER IS
    v_total_pontos NUMBER;
BEGIN
    SELECT SUM(vl_points) INTO v_total_pontos 
    FROM t_gxp_score 
    WHERE id_kid = p_kid_id;

    RETURN NVL(v_total_pontos, 0);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Nenhum ponto encontrado.');
        RETURN 0;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao calcular o total de pontos.');
        RETURN NULL;
END fn_calcular_total_pontos;

-- Fun��o 11: Verificar se um Dispositivo Est� Ativo
CREATE OR REPLACE FUNCTION fn_verificar_dispositivo_ativo(
    p_device_id IN NUMBER
) RETURN VARCHAR2 IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count 
    FROM t_gxp_energy_consumption 
    WHERE id_device = p_device_id AND dt_consumption >= SYSDATE - 30;

    IF v_count > 0 THEN
        RETURN 'Dispositivo ativo.';
    ELSE
        RETURN 'Dispositivo inativo.';
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao verificar o status do dispositivo.');
        RETURN 'Erro';
END fn_verificar_dispositivo_ativo;

-- Fun��o 12: Calcular o Tempo de Uso de um Dispositivo
CREATE OR REPLACE FUNCTION fn_calcular_tempo_uso(
    p_device_id IN NUMBER
) RETURN NUMBER IS
    v_tempo_uso NUMBER;
BEGIN
    SELECT SUM(vl_usage_time) INTO v_tempo_uso 
    FROM t_gxp_device 
    WHERE id_device = p_device_id;

    RETURN NVL(v_tempo_uso, 0);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Nenhum registro de uso encontrado.');
        RETURN 0;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao calcular o tempo de uso.');
        RETURN NULL;
END fn_calcular_tempo_uso;

-- Fun��o 13: Validar a Exist�ncia de um Dispositivo
CREATE OR REPLACE FUNCTION fn_validar_existencia_dispositivo(
    p_device_id IN NUMBER
) RETURN VARCHAR2 IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count 
    FROM t_gxp_device 
    WHERE id_device = p_device_id;

    IF v_count > 0 THEN
        RETURN 'Dispositivo existe.';
    ELSE
        RETURN 'Dispositivo n�o encontrado.';
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao validar a exist�ncia do dispositivo.');
        RETURN 'Erro';
END fn_validar_existencia_dispositivo;

-- Exemplos de Execu��o das Fun��es

-- 1. Calcular a Idade de uma Crian�a
BEGIN
    DBMS_OUTPUT.PUT_LINE('Idade: ' || fn_calcular_idade(TO_DATE('2015-03-10', 'YYYY-MM-DD')));
END;

-- 2. Validar Consumo de Energia
BEGIN
    DBMS_OUTPUT.PUT_LINE('Status do Consumo: ' || fn_validar_consumo_energia(450));
END;

-- 3. Validar Formato de Data de Nascimento
BEGIN
    DBMS_OUTPUT.PUT_LINE('Valida��o da Data: ' || fn_validar_data_nascimento('2015-03-10'));
END;

-- 4. Calcular a M�dia de Pontua��o
BEGIN
    DBMS_OUTPUT.PUT_LINE('M�dia de Pontua��o: ' || fn_calcular_media_pontuacao(1)); -- Substitua 1 pelo ID da crian�a
END;

-- 5. Validar Idade da Crian�a
BEGIN
    DBMS_OUTPUT.PUT_LINE('Status da Idade: ' || fn_validar_idade(TO_DATE('2010-05-15', 'YYYY-MM-DD')));
END;

-- 6. Calcular a Economia de Energia
BEGIN
    DBMS_OUTPUT.PUT_LINE('Economia Total: ' || fn_calcular_economia_total(1)); -- Substitua 1 pelo ID do dispositivo
END;

-- 7. Verificar Participa��o em Comunidade
BEGIN
    DBMS_OUTPUT.PUT_LINE('Participa��o: ' || fn_verificar_participacao_community(1, 1)); -- Substitua 1 pelo ID da crian�a e da comunidade
END;

-- 8. Contar Dispositivos de uma Crian�a
BEGIN
    DBMS_OUTPUT.PUT_LINE('Total de Dispositivos: ' || fn_contar_dispositivos(1)); -- Substitua 1 pelo ID da crian�a
END;

-- 9. Validar Pontua��o de um Desafio
BEGIN
    DBMS_OUTPUT.PUT_LINE('Valida��o de Pontua��o: ' || fn_validar_pontuacao_desafio(1, 1)); -- Substitua 1 pelo ID da crian�a e do desafio
END;

-- 10. Calcular Total de Pontos de uma Crian�a
BEGIN
    DBMS_OUTPUT.PUT_LINE('Total de Pontos: ' || fn_calcular_total_pontos(1)); -- Substitua 1 pelo ID da crian�a
END;

-- 11. Verificar se um Dispositivo Est� Ativo
BEGIN
    DBMS_OUTPUT.PUT_LINE('Status do Dispositivo: ' || fn_verificar_dispositivo_ativo(1)); -- Substitua 1 pelo ID do dispositivo
END;

-- 12. Calcular o Tempo de Uso de um Dispositivo
BEGIN
    DBMS_OUTPUT.PUT_LINE('Tempo de Uso: ' || fn_calcular_tempo_uso(1)); -- Substitua 1 pelo ID do dispositivo
END;

-- 13. Validar a Exist�ncia de um Dispositivo
BEGIN
    DBMS_OUTPUT.PUT_LINE('Valida��o de Exist�ncia: ' || fn_validar_existencia_dispositivo(1)); -- Substitua 1 pelo ID do dispositivo
END;