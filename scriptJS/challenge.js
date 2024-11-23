
db.createCollection('t_ampz_challenge');


db.t_ampz_challenge.insertMany([
  {
    desafio: 'Reduzir o consumo de energia por 7 dias.',
    pontos: 150,
    data_inicio: new Date('2024-11-01'),
    data_fim: new Date('2024-11-07'),
    recompensa: 100,
    id_desafio: 1
  },
  {
    desafio: 'Instalar um dispositivo eficiente.',
    pontos: 200,
    data_inicio: new Date('2024-11-02'),
    data_fim: new Date('2024-11-09'),
    recompensa: 120,
    id_desafio: 2
  },
  {
    desafio: 'Reciclar por 1 semana.',
    pontos: 100,
    data_inicio: new Date('2024-11-03'),
    data_fim: new Date('2024-11-10'),
    recompensa: 80,
    id_desafio: 3
  },
  {
    desafio: 'Plantar uma arvore.',
    pontos: 180,
    data_inicio: new Date('2024-11-04'),
    data_fim: new Date('2024-11-11'),
    recompensa: 110,
    id_desafio: 4
  },
  {
    desafio: 'Participar de um mutirao ambiental.',
    pontos: 220,
    data_inicio: new Date('2024-11-05'),
    data_fim: new Date('2024-11-12'),
    recompensa: 130,
    id_desafio: 5
  },
  {
    desafio: 'Trocar lampadas por LED.',
    pontos: 140,
    data_inicio: new Date('2024-11-06'),
    data_fim: new Date('2024-11-13'),
    recompensa: 90,
    id_desafio: 6
  },
  {
    desafio: 'Economizar agua por 10 dias.',
    pontos: 170,
    data_inicio: new Date('2024-11-07'),
    data_fim: new Date('2024-11-17'),
    recompensa: 115,
    id_desafio: 7
  },
  {
    desafio: 'Usar transporte publico por 1 semana.',
    pontos: 160,
    data_inicio: new Date('2024-11-08'),
    data_fim: new Date('2024-11-15'),
    recompensa: 100,
    id_desafio: 8
  },
  {
    desafio: 'Realizar um evento de conscientizacao.',
    pontos: 250,
    data_inicio: new Date('2024-11-09'),
    data_fim: new Date('2024-11-16'),
    recompensa: 140,
    id_desafio: 9
  },
  {
    desafio: 'Economizar energia no fim de semana.',
    pontos: 120,
    data_inicio: new Date('2024-11-10'),
    data_fim: new Date('2024-11-12'),
    recompensa: 75,
    id_desafio: 10
  }
]);

