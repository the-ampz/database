BEGIN
    insert_address('Rua das Flores', '123', 'Apto 101', 'Jardim Primavera', 'São Paulo', 'SP');
    insert_address('Avenida Paulista', '500', NULL, 'Centro', 'São Paulo', 'SP');
    insert_address('Rua Verde', '87', NULL, 'Parque das Árvores', 'Rio de Janeiro', 'RJ');
    insert_address('Rua Azul', '45B', 'Casa', 'Vila Nova', 'Porto Alegre', 'RS');
    insert_address('Alameda Branca', '1000', 'Bloco B', 'Morumbi', 'São Paulo', 'SP');
    insert_address('Rua Amarela', '210', NULL, 'Centro', 'Campinas', 'SP');
    insert_address('Avenida Beira Mar', '67', NULL, 'Barra da Tijuca', 'Rio de Janeiro', 'RJ');
    insert_address('Rua da Paz', '150', 'Casa 3', 'Liberdade', 'São Paulo', 'SP');
    insert_address('Travessa Alegria', '89', NULL, 'Centro', 'Belo Horizonte', 'MG');
    insert_address('Estrada da Serra', '5000', 'Fazenda', 'Rural', 'Curitiba', 'PR');
END;
/

BEGIN
    insert_user('João Silva', 'joao.silva@gmail.com', 'senha123', 1, TO_DATE('1990-01-01', 'YYYY-MM-DD'));
    insert_user('Maria Oliveira', 'maria.oliveira@gmail.com', 'senha123', 2, TO_DATE('1985-05-15', 'YYYY-MM-DD'));
    insert_user('Carlos Pereira', 'carlos.pereira@gmail.com', 'senha123', 3, TO_DATE('2000-07-20', 'YYYY-MM-DD'));
    insert_user('Ana Costa', 'ana.costa@gmail.com', 'senha123', 4, TO_DATE('1995-09-10', 'YYYY-MM-DD'));
    insert_user('Paula Nunes', 'paula.nunes@gmail.com', 'senha123', 5, TO_DATE('1988-03-08', 'YYYY-MM-DD'));
    insert_user('Pedro Souza', 'pedro.souza@gmail.com', 'senha123', 6, TO_DATE('1992-12-05', 'YYYY-MM-DD'));
    insert_user('Fernanda Lima', 'fernanda.lima@gmail.com', 'senha123', 7, TO_DATE('1987-10-25', 'YYYY-MM-DD'));
    insert_user('Rafael Alves', 'rafael.alves@gmail.com', 'senha123', 8, TO_DATE('2001-06-30', 'YYYY-MM-DD'));
    insert_user('Julia Mendes', 'julia.mendes@gmail.com', 'senha123', 9, TO_DATE('1999-02-28', 'YYYY-MM-DD'));
    insert_user('Rodrigo Santos', 'rodrigo.santos@gmail.com', 'senha123', 10, TO_DATE('1994-04-18', 'YYYY-MM-DD'));
END;
/

BEGIN
    insert_kid(1, 'Lucas', TO_DATE('2015-04-23', 'YYYY-MM-DD'));
    insert_kid(2, 'Maria', TO_DATE('2014-03-11', 'YYYY-MM-DD'));
    insert_kid(3, 'João', TO_DATE('2013-05-18', 'YYYY-MM-DD'));
    insert_kid(4, 'Ana', TO_DATE('2016-09-07', 'YYYY-MM-DD'));
    insert_kid(5, 'Pedro', TO_DATE('2015-12-02', 'YYYY-MM-DD'));
    insert_kid(6, 'Sofia', TO_DATE('2017-07-14', 'YYYY-MM-DD'));
    insert_kid(7, 'Gabriel', TO_DATE('2014-11-30', 'YYYY-MM-DD'));
    insert_kid(8, 'Laura', TO_DATE('2016-01-25', 'YYYY-MM-DD'));
    insert_kid(9, 'Felipe', TO_DATE('2013-08-19', 'YYYY-MM-DD'));
    insert_kid(10, 'Julia', TO_DATE('2017-02-10', 'YYYY-MM-DD'));
END;
/

BEGIN
    insert_device(1, 'Tablet', 'Eletrônico', 'Android', 20, 5);
    insert_device(2, 'Smartphone', 'Eletrônico', 'iOS', 15, 4);
    insert_device(3, 'Laptop', 'Eletrônico', 'Windows', 30, 8);
    insert_device(4, 'Desktop', 'Eletrônico', 'Linux', 50, 12);
    insert_device(5, 'Smartwatch', 'Eletrônico', 'WearOS', 10, 2);
    insert_device(6, 'Kindle', 'Eletrônico', 'Proprietário', 8, 1);
    insert_device(7, 'Console', 'Eletrônico', 'Proprietário', 40, 9);
    insert_device(8, 'Câmera', 'Eletrônico', 'Firmware', 25, 6);
    insert_device(9, 'TV Smart', 'Eletrônico', 'Proprietário', 60, 15);
    insert_device(10, 'Speaker', 'Eletrônico', 'Firmware', 12, 3);
END;
/

BEGIN
    insert_community('Eco Warriors', 'Comunidade para preservação do meio ambiente.');
    insert_community('Tech Enthusiasts', 'Discussões sobre tecnologia e inovação.');
    insert_community('Book Lovers', 'Clube de leitura para apaixonados por livros.');
    insert_community('Fitness Goals', 'Motivação e dicas de treino.');
    insert_community('Gamers Unite', 'Jogos e competições online.');
    insert_community('Music Makers', 'Produção musical e aprendizado.');
    insert_community('Movie Buffs', 'Discussões sobre filmes e séries.');
    insert_community('Nature Explorers', 'Exploração de trilhas e aventuras.');
    insert_community('Healthy Living', 'Receitas e dicas para uma vida saudável.');
    insert_community('Global Citizens', 'Debates sobre questões globais.');
END;
/

BEGIN
    insert_community_participation(1, 1, 100);
    insert_community_participation(2, 2, 120);
    insert_community_participation(3, 3, 110);
    insert_community_participation(4, 4, 95);
    insert_community_participation(5, 5, 130);
    insert_community_participation(6, 6, 85);
    insert_community_participation(7, 7, 90);
    insert_community_participation(8, 8, 115);
    insert_community_participation(9, 9, 100);
    insert_community_participation(10, 10, 105);
END;
/

BEGIN
    insert_challenge('Reduzir o consumo de energia por 7 dias.', 150, TO_DATE('2024-11-01', 'YYYY-MM-DD'), TO_DATE('2024-11-07', 'YYYY-MM-DD'), 100, 1);
    insert_challenge('Instalar um dispositivo eficiente.', 200, TO_DATE('2024-11-02', 'YYYY-MM-DD'), TO_DATE('2024-11-09', 'YYYY-MM-DD'), 120, 2);
    insert_challenge('Reciclar por 1 semana.', 100, TO_DATE('2024-11-03', 'YYYY-MM-DD'), TO_DATE('2024-11-10', 'YYYY-MM-DD'), 80, 3);
    insert_challenge('Plantar uma árvore.', 180, TO_DATE('2024-11-04', 'YYYY-MM-DD'), TO_DATE('2024-11-11', 'YYYY-MM-DD'), 110, 4);
    insert_challenge('Participar de um mutirão ambiental.', 220, TO_DATE('2024-11-05', 'YYYY-MM-DD'), TO_DATE('2024-11-12', 'YYYY-MM-DD'), 130, 5);
    insert_challenge('Trocar lâmpadas por LED.', 140, TO_DATE('2024-11-06', 'YYYY-MM-DD'), TO_DATE('2024-11-13', 'YYYY-MM-DD'), 90, 6);
    insert_challenge('Economizar água por 10 dias.', 170, TO_DATE('2024-11-07', 'YYYY-MM-DD'), TO_DATE('2024-11-17', 'YYYY-MM-DD'), 115, 7);
    insert_challenge('Usar transporte público por 1 semana.', 160, TO_DATE('2024-11-08', 'YYYY-MM-DD'), TO_DATE('2024-11-15', 'YYYY-MM-DD'), 100, 8);
    insert_challenge('Realizar um evento de conscientização.', 250, TO_DATE('2024-11-09', 'YYYY-MM-DD'), TO_DATE('2024-11-16', 'YYYY-MM-DD'), 140, 9);
    insert_challenge('Economizar energia no fim de semana.', 120, TO_DATE('2024-11-10', 'YYYY-MM-DD'), TO_DATE('2024-11-12', 'YYYY-MM-DD'), 75, 10);
END;
/

BEGIN
    insert_energy_consumption(1, 'Diário', 10, 2, TO_DATE('2024-11-10', 'YYYY-MM-DD'));
    insert_energy_consumption(2, 'Mensal', 300, 50, TO_DATE('2024-11-09', 'YYYY-MM-DD'));
    insert_energy_consumption(3, 'Semanal', 70, 10, TO_DATE('2024-11-08', 'YYYY-MM-DD'));
    insert_energy_consumption(4, 'Anual', 3600, 500, TO_DATE('2024-11-07', 'YYYY-MM-DD'));
    insert_energy_consumption(5, 'Diário', 15, 3, TO_DATE('2024-11-06', 'YYYY-MM-DD'));
    insert_energy_consumption(6, 'Semanal', 60, 8, TO_DATE('2024-11-05', 'YYYY-MM-DD'));
    insert_energy_consumption(7, 'Mensal', 250, 40, TO_DATE('2024-11-04', 'YYYY-MM-DD'));
    insert_energy_consumption(8, 'Diário', 12, 2, TO_DATE('2024-11-03', 'YYYY-MM-DD'));
    insert_energy_consumption(9, 'Anual', 4000, 600, TO_DATE('2024-11-02', 'YYYY-MM-DD'));
    insert_energy_consumption(10, 'Semanal', 90, 12, TO_DATE('2024-11-01', 'YYYY-MM-DD'));
END;
/

BEGIN
    insert_score(1, 1, 100, TO_DATE('2024-11-20', 'YYYY-MM-DD'));
    insert_score(2, 2, 120, TO_DATE('2024-11-19', 'YYYY-MM-DD'));
    insert_score(3, 3, 150, TO_DATE('2024-11-18', 'YYYY-MM-DD'));
    insert_score(4, 4, 110, TO_DATE('2024-11-17', 'YYYY-MM-DD'));
    insert_score(5, 5, 130, TO_DATE('2024-11-16', 'YYYY-MM-DD'));
    insert_score(6, 6, 140, TO_DATE('2024-11-15', 'YYYY-MM-DD'));
    insert_score(7, 7, 170, TO_DATE('2024-11-14', 'YYYY-MM-DD'));
    insert_score(8, 8, 90, TO_DATE('2024-11-13', 'YYYY-MM-DD'));
    insert_score(9, 9, 200, TO_DATE('2024-11-12', 'YYYY-MM-DD'));
    insert_score(10, 10, 80, TO_DATE('2024-11-11', 'YYYY-MM-DD'));
END;
/

COMMIT;
