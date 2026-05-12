create database Loja_Eletronico;
use Loja_Eletronico;

create table Clientes(
	id_cliente int auto_increment primary key,
    nome varchar(100) not null,
    cpf varchar(11) not null,
    telefone varchar(15) not null
);

create table Pagamentos(
	id_pagamento int auto_increment primary key,
    tipo_pagamento varchar(100) not null
);

create table Vendas(
	id_venda int auto_increment primary key,
    data_venda date not null,
    valor_total decimal(10, 2) not null,
    id_cliente int not null,
    foreign key(id_cliente) references Clientes(id_cliente),
    id_pagamento int not null,
    foreign key(id_pagamento) references Pagamentos(id_pagamento)
);

create table Produtos(
	id_produto int auto_increment primary key,
    nome varchar(100) not null,
    preco decimal(7, 2) not null,
    categoria varchar(100) not null,
    marca varchar(100) not null,
    quantidade_estoque int not null
);

create table Prod_Venda(
	quantidade int not null,
    id_produto int not null,
    id_venda int not null,
    primary key(id_produto, id_venda),
    foreign key(id_produto) references Produtos(id_produto),
    foreign key(id_venda) references Vendas(id_venda)
);