create database Manutencao;
use Manutencao;

create table Maquinas(
	id_maquina int auto_increment primary key,
    codigo varchar(100) not null,
    nome varchar(100) not null,
    setor varchar(100) not null,
    data_aquisicao date not null
);

create table Registro(
	id_registro int auto_increment primary key,
    descricao text not null,
    tempo_gasto int not null
);

create table Pecas(
	id_peca int auto_increment primary key,
    quantidade_utilizada int not null,
    custo decimal(10, 2) not null,
    quantidade_disponivel int not null,
    estoque_minimo int not null
);

create table Tecnicos(
	id_tecnico int auto_increment primary key,
    nome varchar(100) not null,
    cpf varchar(11) not null,
    especialidade varchar(100) not null
);

create table Ordem_Servico(
	id_ordem int auto_increment primary key,
    data_abertura date not null,
    data_fechamento date not null,
    status_ordem enum('aberta', 'em andamento', 'concluida'),
    id_maquina int not null,
    foreign key(id_maquina) references Maquinas(id_maquina),
    id_registro int not null,
    foreign key(id_registro) references Registro(id_registro)
);

create table Ordem_Tecnico(
	id_ordem_tecnico int auto_increment primary key,
	id_tecnico int not null,
    foreign key(id_tecnico) references Tecnicos(id_tecnico),
	id_ordem int not null,
    foreign key(id_ordem) references Ordem_Servico(id_ordem)
);

create table Peca_Ordem(
	id_peca_tecnico int auto_increment primary key,
	id_peca int not null,
    foreign key(id_peca) references Pecas(id_peca),
	id_ordem int not null,
    foreign key(id_ordem) references Ordem_Servico(id_ordem)
);