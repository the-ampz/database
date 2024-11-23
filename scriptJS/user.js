db.createCollection('t_ampz_user');


db.t_ampz_user.insertMany([
  {
    username: 'JoaoSilva',
    email: 'joao.silva@gmail.com',
    password: 'senha123',
    user_id: 1,
    birth_date: new Date('1990-01-01')
  },
  {
    username: 'MariaOliveira',
    email: 'maria.oliveira@gmail.com',
    password: 'senha123',
    user_id: 2,
    birth_date: new Date('1985-05-15')
  },
  {
    username: 'CarlosPereira',
    email: 'carlos.pereira@gmail.com',
    password: 'senha123',
    user_id: 3,
    birth_date: new Date('2000-07-20')
  },
  {
    username: 'AnaCosta',
    email: 'ana.costa@gmail.com',
    password: 'senha123',
    user_id: 4,
    birth_date: new Date('1995-09-10')
  },
  {
    username: 'PaulaNunes',
    email: 'paula.nunes@gmail.com',
    password: 'senha123',
    user_id: 5,
    birth_date: new Date('1988-03-08')
  },
  {
    username: 'PedroSouza',
    email: 'pedro.souza@gmail.com',
    password: 'senha123',
    user_id: 6,
    birth_date: new Date('1992-12-05')
  },
  {
    username: 'FernandaLima',
    email: 'fernanda.lima@gmail.com',
    password: 'senha123',
    user_id: 7,
    birth_date: new Date('1987-10-25')
  },
  {
    username: 'RafaelAlves',
    email: 'rafael.alves@gmail.com',
    password: 'senha123',
    user_id: 8,
    birth_date: new Date('2001-06-30')
  },
  {
    username: 'JuliaMendes',
    email: 'julia.mendes@gmail.com',
    password: 'senha123',
    user_id: 9,
    birth_date: new Date('1999-02-28')
  },
  {
    username: 'RodrigoSantos',
    email: 'rodrigo.santos@gmail.com',
    password: 'senha123',
    user_id: 10,
    birth_date: new Date('1994-04-18')
  }
]);
