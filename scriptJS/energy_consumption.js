db.createCollection("t_ampz_energy_consumption");

db.t_ampz_energy_consumption.insertMany([
  {
    id: 1,
    tipo: 'Diario',
    consumo: 10,
    custo: 2,
    data: ISODate("2024-11-10T00:00:00Z")
  },
  {
    id: 2,
    tipo: 'Mensal',
    consumo: 300,
    custo: 50,
    data: ISODate("2024-11-09T00:00:00Z")
  },
  {
    id: 3,
    tipo: 'Semanal',
    consumo: 70,
    custo: 10,
    data: ISODate("2024-11-08T00:00:00Z")
  },
  {
    id: 4,
    tipo: 'Anual',
    consumo: 3600,
    custo: 500,
    data: ISODate("2024-11-07T00:00:00Z")
  },
  {
    id: 5,
    tipo: 'Diario',
    consumo: 15,
    custo: 3,
    data: ISODate("2024-11-06T00:00:00Z")
  },
  {
    id: 6,
    tipo: 'Semanal',
    consumo: 60,
    custo: 8,
    data: ISODate("2024-11-05T00:00:00Z")
  },
  {
    id: 7,
    tipo: 'Mensal',
    consumo: 250,
    custo: 40,
    data: ISODate("2024-11-04T00:00:00Z")
  },
  {
    id: 8,
    tipo: 'Diario',
    consumo: 12,
    custo: 2,
    data: ISODate("2024-11-03T00:00:00Z")
  },
  {
    id: 9,
    tipo: 'Anual',
    consumo: 4000,
    custo: 600,
    data: ISODate("2024-11-02T00:00:00Z")
  },
  {
    id: 10,
    tipo: 'Semanal',
    consumo: 90,
    custo: 12,
    data: ISODate("2024-11-01T00:00:00Z")
  }
]);
