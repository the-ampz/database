BEGIN
    -- Endereços
    insert_address('Rua das Flores', '123', 'Apto 45', 'Centro', 'São Paulo', 'SP');
    insert_address('Avenida Brasil', '456', 'Bloco B', 'Jardins', 'São Paulo', 'SP');
    insert_address('Rua dos Limoeiros', '789', NULL, 'Vila Nova', 'Rio de Janeiro', 'RJ');
    insert_address('Rua das Acácias', '101', 'Casa 1', 'Lapa', 'Belo Horizonte', 'MG');
    insert_address('Avenida das Palmeiras', '202', NULL, 'Centro', 'Curitiba', 'PR');
    insert_address('Rua das Orquídeas', '303', 'Apto 12', 'Moema', 'São Paulo', 'SP');
    insert_address('Rua dos Girassóis', '404', 'Casa 3', 'Botafogo', 'Rio de Janeiro', 'RJ');
    insert_address('Rua do Sol', '505', NULL, 'Centro', 'Florianópolis', 'SC');
    insert_address('Avenida das Águas', '606', 'Bloco A', 'Lagoa', 'Rio de Janeiro', 'RJ');
    insert_address('Rua dos Eucaliptos', '707', NULL, 'Vila Mariana', 'São Paulo', 'SP');

    -- Usuários
    insert_user('Maria Silva', 'maria@example.com', 'senha123', 1, TO_DATE('2010-02-15', 'YYYY-MM-DD'));
    insert_user('João Souza', 'joao@example.com', 'senha123', 2, TO_DATE('2011-03-20', 'YYYY-MM-DD'));
    insert_user('Ana Costa', 'ana@example.com', 'senha123', 3, TO_DATE('2012-04-25', 'YYYY-MM-DD'));
    insert_user('Lucas Almeida', 'lucas@example.com', 'senha123', 4, TO_DATE('2013-05-30', 'YYYY-MM-DD'));
    insert_user('Juliana Pereira', 'juliana@example.com', 'senha123', 5, TO_DATE('2014-06-15', 'YYYY-MM-DD'));
    insert_user('Pedro Santos', 'pedro@example.com', 'senha123', 6, TO_DATE('2015-07-10', 'YYYY-MM-DD'));
    insert_user('Carla Mendes', 'carla@example.com', 'senha123', 7, TO_DATE('2016-08-05', 'YYYY-MM-DD'));
    insert_user('Rafael Lima', 'rafael@example.com', 'senha123', 8, TO_DATE('2017-09-01', 'YYYY-MM-DD'));
    insert_user('Fernanda Rocha', 'fernanda@example.com', 'senha123', 9, TO_DATE('2018-10-12', 'YYYY-MM-DD'));
    insert_user('Thiago Martins', 'thiago@example.com', 'senha123', 10, TO_DATE('2019-11-20', 'YYYY-MM-DD'));

    -- Crianças
    insert_kid(1, 'Gabriel Silva', TO_DATE('2015-01-01', 'YYYY-MM-DD'));
    insert_kid(1, 'Sofia Silva', TO_DATE('2016-02-02', 'YYYY-MM-DD'));
    insert_kid(2, 'Miguel Souza', TO_DATE('2014-03-03', 'YYYY-MM-DD'));
    insert_kid(3, 'Alice Costa', TO_DATE('2013-04-04', 'YYYY-MM-DD'));
    insert_kid(4, 'Rafael Almeida', TO_DATE('2012-05-05', 'YYYY-MM-DD'));
    insert_kid(5, 'Isabela Pereira', TO_DATE('2011-06-06', 'YYYY-MM-DD'));
    insert_kid(6, 'Samuel Santos', TO_DATE('2010-07-07', 'YYYY-MM-DD'));
    insert_kid(7, 'Laura Mendes', TO_DATE('2009-08-08', 'YYYY-MM-DD'));
    insert_kid(8, 'Felipe Lima', TO_DATE('2008-09-09', 'YYYY-MM-DD'));
    insert_kid(9, 'Bianca Rocha', TO_DATE('2007-10-10', 'YYYY-MM-DD'));
    insert_kid(10, 'Mariana Costa', TO_DATE('2006-11-11', 'YYYY-MM-DD'));

    -- Dispositivos
    insert_device(1, 'Tablet', 'Eletrônico', 'Android', 10, 32);
    insert_device(2, 'Smartphone', 'Eletrônico', 'iOS', 15, 64);
    insert_device(3, 'Notebook', 'Eletrônico', 'Windows', 50, 256);
    insert_device(4, 'Console', 'Eletrônico', 'PlayStation', 20, 128);
    insert_device(5, 'Smart TV', 'Eletrônico', 'Android', 30, 64);
    insert_device(6, 'Desktop', 'Eletrônico', 'Linux', 60, 512);
    insert_device(7, 'E-reader', 'Eletrônico', 'Kindle', 5, 8);
    insert_device(8, 'Smartwatch', 'Eletrônico', 'Wear OS', 8, 16);
    insert_device(9, 'Drone', 'Eletrônico', 'Custom', 25, 32);
    insert_device(10, 'Camera', 'Eletrônico', 'DSLR', 40, 256);

    -- Comunidades
    insert_community('Comunidade Verde', 'Uma comunidade focada em práticas sustentáveis.');
    insert_community('Jovens Sustentáveis', 'Grupo de jovens engajados em projetos ecológicos.');
    insert_community('Mães Ecológicas', 'Mães que buscam um mundo melhor para seus filhos.');
    insert_community('Futuro Limpo', 'Iniciativas para um futuro mais limpo e sustentável.');
    insert_community('Sustentabilidade Ativa', 'Atividades que promovem a sustentabilidade.');
    insert_community('Cidadania Verde', 'Cidadãos que lutam por um planeta mais verde.');
    insert_community('Eco Amigos', 'Amigos que se juntam para fazer a diferença.');
    insert_community('Planeta Limpo', 'Ações para manter nosso planeta limpo.');
    insert_community('Futuro Sustentável', 'Trabalhando por um futuro sustentável.');
    insert_community('Cultura Verde', 'Cultura e práticas sustentáveis na comunidade.');

    -- Desafios
    insert_challenge('Reduzir o consumo de energia em 20%', 50, TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-03-31', 'YYYY-MM-DD'), 1, 1);
    insert_challenge('Participar de um mutirão de limpeza', 30, TO_DATE('2023-04-01', 'YYYY-MM-DD'), TO_DATE('2023-06-30', 'YYYY-MM-DD'), 2, 2);
    insert_challenge('Usar energia solar por uma semana', 70, TO_DATE('2023-05-01', 'YYYY-MM-DD'), TO_DATE('2023-07-31', 'YYYY-MM-DD'), 3, 3);
    insert_challenge('Conduzir uma oficina de reciclagem', 40, TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2023-09-30', 'YYYY-MM-DD'), 4, 4);
    insert_challenge('Participar de um debate sobre sustentabilidade', 25, TO_DATE('2023-07-01', 'YYYY-MM-DD'), TO_DATE('2023-10-31', 'YYYY-MM-DD'), 5, 5);
    insert_challenge('Contribuir com ideias para o meio ambiente', 20, TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2023-11-30', 'YYYY-MM-DD'), 6, 6);
    insert_challenge('Reduzir o uso de plástico', 35, TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 1, 1);
    insert_challenge('Plantio de árvores na comunidade', 60, TO_DATE('2023-10-01', 'YYYY-MM-DD'), TO_DATE('2024-01-31', 'YYYY-MM-DD'), 7, 7);
    insert_challenge('Desafio da economia de água', 55, TO_DATE('2023-11-01', 'YYYY-MM-DD'), TO_DATE('2024-02-28', 'YYYY-MM-DD'), 3, 3);
    insert_challenge('Criar uma campanha de conscientização', 80, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-04-30', 'YYYY-MM-DD'), 2, 2);

    -- Pontuação
    insert_score(1, 1, 50, TO_DATE('2023-01-10', 'YYYY-MM-DD'));
    insert_score(1, 2, 30, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
    insert_score(2, 1, 25, TO_DATE('2023-01-20', 'YYYY-MM-DD'));
    insert_score(3, 3, 70, TO_DATE('2023-02-01', 'YYYY-MM-DD'));
    insert_score(4, 4, 40, TO_DATE('2023-02-10', 'YYYY-MM-DD'));
    insert_score(5, 5, 25, TO_DATE('2023-02-15', 'YYYY-MM-DD'));
    insert_score(6, 6, 60, TO_DATE('2023-02-20', 'YYYY-MM-DD'));
    insert_score(7, 7, 20, TO_DATE('2023-03-01', 'YYYY-MM-DD'));
    insert_score(8, 8, 80, TO_DATE('2023-03-10', 'YYYY-MM-DD'));
    insert_score(9, 9, 55, TO_DATE('2023-03-15', 'YYYY-MM-DD'));

    -- Consumo de Energia
    insert_energy_consumption(1, 'Consumo Normal', 100, 10, TO_DATE('2023-01-10', 'YYYY-MM-DD'));
    insert_energy_consumption(2, 'Consumo Normal', 150, 15, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
    insert_energy_consumption(3, 'Consumo Normal', 200, 20, TO_DATE('2023-01-20', 'YYYY-MM-DD'));
    insert_energy_consumption(4, 'Consumo Normal', 250, 25, TO_DATE('2023-01-25', 'YYYY-MM-DD'));
    insert_energy_consumption(5, 'Consumo Normal', 300, 30, TO_DATE('2023-02-01', 'YYYY-MM-DD'));
    insert_energy_consumption(6, 'Consumo Normal', 350, 35, TO_DATE('2023-02-05', 'YYYY-MM-DD'));
    insert_energy_consumption(7, 'Consumo Normal', 400, 40, TO_DATE('2023-02-10', 'YYYY-MM-DD'));
    insert_energy_consumption(8, 'Consumo Normal', 450, 45, TO_DATE('2023-02-15', 'YYYY-MM-DD'));
    insert_energy_consumption(9, 'Consumo Normal', 500, 50, TO_DATE('2023-02-20', 'YYYY-MM-DD'));
    insert_energy_consumption(10, 'Consumo Normal', 550, 55, TO_DATE('2023-02-25', 'YYYY-MM-DD'));

    -- Participação em Comunidades
    insert_community_participation(1, 1, 10);
    insert_community_participation(1, 2, 15);
    insert_community_participation(2, 1, 20);
    insert_community_participation(3, 3, 25);
    insert_community_participation(4, 4, 30);
    insert_community_participation(5, 5, 5);
    insert_community_participation(6, 6, 10);
    insert_community_participation(7, 7, 15);
    insert_community_participation(8, 8, 20);
    insert_community_participation(9, 9, 25);
    insert_community_participation(10, 10, 30);

    -- Confirma as alterações no banco
    COMMIT;
END;
/