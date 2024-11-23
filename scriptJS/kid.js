
db.createCollection("t_ampz_kid");

db.t_ampz_kid.insertMany([
  { id: 1, nome: "Lucas", data_nascimento: new Date("2015-04-23") },
  { id: 2, nome: "Maria", data_nascimento: new Date("2014-03-11") },
  { id: 3, nome: "Joao", data_nascimento: new Date("2013-05-18") },
  { id: 4, nome: "Ana", data_nascimento: new Date("2016-09-07") },
  { id: 5, nome: "Pedro", data_nascimento: new Date("2015-12-02") },
  { id: 6, nome: "Sofia", data_nascimento: new Date("2017-07-14") },
  { id: 7, nome: "Gabriel", data_nascimento: new Date("2014-11-30") },
  { id: 8, nome: "Laura", data_nascimento: new Date("2016-01-25") },
  { id: 9, nome: "Felipe", data_nascimento: new Date("2013-08-19") },
  { id: 10, nome: "Julia", data_nascimento: new Date("2017-02-10") }
]);

