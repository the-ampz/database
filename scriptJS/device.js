
db.createCollection('t_ampz_device');

db.t_ampz_device.insertMany([
    { 
        device_id: 1, 
        nome: 'Tablet', 
        categoria: 'Eletronico', 
        sistema_operacional: 'Android', 
        quantidade: 20, 
        rating: 5 
    },
    { 
        device_id: 2, 
        nome: 'Smartphone', 
        categoria: 'Eletronico', 
        sistema_operacional: 'iOS', 
        quantidade: 15, 
        rating: 4 
    },
    { 
        device_id: 3, 
        nome: 'Laptop', 
        categoria: 'Eletronico', 
        sistema_operacional: 'Windows', 
        quantidade: 30, 
        rating: 8 
    },
    { 
        device_id: 4, 
        nome: 'Desktop', 
        categoria: 'Eletronico', 
        sistema_operacional: 'Linux', 
        quantidade: 50, 
        rating: 12 
    },
    { 
        device_id: 5, 
        nome: 'Smartwatch', 
        categoria: 'Eletronico', 
        sistema_operacional: 'WearOS', 
        quantidade: 10, 
        rating: 2 
    },
    { 
        device_id: 6, 
        nome: 'Kindle', 
        categoria: 'Eletronico', 
        sistema_operacional: 'Proprietario', 
        quantidade: 8, 
        rating: 1 
    },
    { 
        device_id: 7, 
        nome: 'Console', 
        categoria: 'Eletronico', 
        sistema_operacional: 'Proprietario', 
        quantidade: 40, 
        rating: 9 
    },
    { 
        device_id: 8, 
        nome: 'Camera', 
        categoria: 'Eletronico', 
        sistema_operacional: 'Firmware', 
        quantidade: 25, 
        rating: 6 
    },
    { 
        device_id: 9, 
        nome: 'TV Smart', 
        categoria: 'Eletronico', 
        sistema_operacional: 'Proprietario', 
        quantidade: 60, 
        rating: 15 
    },
    { 
        device_id: 10, 
        nome: 'Speaker', 
        categoria: 'Eletronico', 
        sistema_operacional: 'Firmware', 
        quantidade: 12, 
        rating: 3 
    }
]);
