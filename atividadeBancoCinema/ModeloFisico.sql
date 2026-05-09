create database CinemaEx;
use CinemaEx;

create table Filme(
	id_filme int auto_increment primary key,
    nome varchar(100) not null,
    categoria varchar(100) not null,
    faixa_etaria varchar(100) not null
);

create table Tipo_Sala(
	id_tipo_sala int auto_increment primary key,
    tipo_sala varchar(100) not null
);

create table Sala(
	id_sala int auto_increment primary key,
    numero_sala int not null,
    descricao_sala text not null,
    id_filme int not null,
    foreign key(id_filme) references Filme(id_filme),
    id_tipo_sala int not null,
    foreign key(id_tipo_sala) references Tipo_Sala(id_tipo_sala)
);

create table Sessao(
	id_sessao int auto_increment primary key,
	horario datetime not null,
    id_sala int not null,
    foreign key(id_sala) references Sala(id_sala)
);

create table Cliente(
	id_cliente int auto_increment primary key,
    nome varchar(100) not null,
    rg varchar(11) not null
);

create table Ingresso(
	id_ingresso int auto_increment primary key,
    valor_pagamento decimal(10, 2) not null,
    forma_pagamento varchar(50) not null,
    id_sessao int not null,
    foreign key(id_sessao) references Sessao(id_sessao),
    id_cliente int not null,
    foreign key(id_cliente) references Cliente(id_cliente)
);