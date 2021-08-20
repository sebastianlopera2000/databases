use master
GO
drop database if exists bdpersonas
create database bdpersonas
GO
use bdpersonas
GO

create table pais
(
	id int identity,
	nombre varchar(150),
	constraint pk_pais primary key (id)
)

create table persona
(
	id int identity,
	nombres varchar(250) not null,
	apellidos varchar(250) not null,
	fechaNacim datetime not null,
	fechaFallec datetime null,
	paisNacim int not null,
	constraint pk_pesona primary key (id),
	constraint fk_pais foreign key (paisNacim) references pais (id)
)