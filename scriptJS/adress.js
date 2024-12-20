
db.createCollection('t_ampz_address');


db.t_ampz_address.insertMany([
    {
        ds_street: 'Rua das Flores',
        ds_number: '123',
        ds_complement: 'Apto 101',
        ds_district: 'Jardim Primavera',
        ds_city: 'Sao Paulo',
        ds_state: 'SP'
    },
    {
        ds_street: 'Avenida Paulista',
        ds_number: '500',
        ds_complement: null,
        ds_district: 'Centro',
        ds_city: 'Sao Paulo',
        ds_state: 'SP'
    },
    {
        ds_street: 'Rua Verde',
        ds_number: '87',
        ds_complement: null,
        ds_district: 'Parque das Arvores',
        ds_city: 'Rio de Janeiro',
        ds_state: 'RJ'
    },
    {
        ds_street: 'Rua Azul',
        ds_number: '45B',
        ds_complement: 'Casa',
        ds_district: 'Vila Nova',
        ds_city: 'Porto Alegre',
        ds_state: 'RS'
    },
    {
        ds_street: 'Alameda Branca',
        ds_number: '1000',
        ds_complement: 'Bloco B',
        ds_district: 'Morumbi',
        ds_city: 'Sao Paulo',
        ds_state: 'SP'
    },
    {
        ds_street: 'Rua Amarela',
        ds_number: '210',
        ds_complement: null,
        ds_district: 'Centro',
        ds_city: 'Campinas',
        ds_state: 'SP'
    },
    {
        ds_street: 'Avenida Beira Mar',
        ds_number: '67',
        ds_complement: null,
        ds_district: 'Barra da Tijuca',
        ds_city: 'Rio de Janeiro',
        ds_state: 'RJ'
    },
    {
        ds_street: 'Rua da Paz',
        ds_number: '150',
        ds_complement: 'Casa 3',
        ds_district: 'Liberdade',
        ds_city: 'Sao Paulo',
        ds_state: 'SP'
    },
    {
        ds_street: 'Travessa Alegria',
        ds_number: '89',
        ds_complement: null,
        ds_district: 'Centro',
        ds_city: 'Belo Horizonte',
        ds_state: 'MG'
    },
    {
        ds_street: 'Estrada da Serra',
        ds_number: '5000',
        ds_complement: 'Fazenda',
        ds_district: 'Rural',
        ds_city: 'Curitiba',
        ds_state: 'PR'
    }
]);