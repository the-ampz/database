
db.createCollection('t_ampz_score');


db.t_ampz_score.insertMany([
    { player_id: 1, game_id: 1, score: 100, date: new Date('2024-11-20') },
    { player_id: 2, game_id: 2, score: 120, date: new Date('2024-11-19') },
    { player_id: 3, game_id: 3, score: 150, date: new Date('2024-11-18') },
    { player_id: 4, game_id: 4, score: 110, date: new Date('2024-11-17') },
    { player_id: 5, game_id: 5, score: 130, date: new Date('2024-11-16') },
    { player_id: 6, game_id: 6, score: 140, date: new Date('2024-11-15') },
    { player_id: 7, game_id: 7, score: 170, date: new Date('2024-11-14') },
    { player_id: 8, game_id: 8, score: 90, date: new Date('2024-11-13') },
    { player_id: 9, game_id: 9, score: 200, date: new Date('2024-11-12') },
    { player_id: 10, game_id: 10, score: 80, date: new Date('2024-11-11') }
]);

