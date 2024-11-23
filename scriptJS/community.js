
db.createCollection("t_ampz_community")


db.t_ampz_community.insertMany([
    { name: "Eco Warriors", description: "Comunidade para preservacao do meio ambiente." },
    { name: "Tech Enthusiasts", description: "Discussoes sobre tecnologia e inovacao." },
    { name: "Book Lovers", description: "Clube de leitura para apaixonados por livros." },
    { name: "Fitness Goals", description: "Motivacao e dicas de treino." },
    { name: "Gamers Unite", description: "Jogos e competicoes online." },
    { name: "Music Makers", description: "Producao musical e aprendizado." },
    { name: "Movie Buffs", description: "Discussoes sobre filmes e series." },
    { name: "Nature Explorers", description: "Exploracao de trilhas e aventuras." },
    { name: "Healthy Living", description: "Receitas e dicas para uma vida saudavel." },
    { name: "Global Citizens", description: "Debates sobre questoes globais." }
])
