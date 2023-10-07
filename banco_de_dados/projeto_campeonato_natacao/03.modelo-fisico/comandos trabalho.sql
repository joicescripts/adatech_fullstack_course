CREATE TABLE IF NOT EXISTS public.pessoas_inscritas
(
    numero_matricula int not null,
    nome varchar(50) not null, 
    codigo_equipe int not null,
    --<restrições>
    constraint pessoas_inscritas_pk primary key(numero_matricula)
);

select * from pessoas_inscritas ;


insert into pessoas_inscritas (numero_matricula, nome, codigo_equipe) values(987612, 'Laura Fernandes', 001);

insert into pessoas_inscritas (numero_matricula, nome, codigo_equipe) values(876123, 'Rafael Silva', 001);

insert into pessoas_inscritas (numero_matricula, nome, codigo_equipe) values(765123, 'Juliana Santos', 002);

insert into pessoas_inscritas (numero_matricula, nome, codigo_equipe) values(654123, 'Marcelo Almeida', 002);

insert into pessoas_inscritas (numero_matricula, nome, codigo_equipe) values(543123, 'Carolina Lima', 003);


ALTER TABLE public.pessoas_inscritas
ADD CONSTRAINT cod_pessoas_inscritas_fk
FOREIGN KEY (codigo_equipe)
REFERENCES equipe(codigo_equipe);




CREATE TABLE IF NOT EXISTS public.nadadores
(
    numero_matricula int not null,
    dt_inscricao date not null, 
    sexo smallint not null, 
    dt_nasc date not null, 
    email varchar(50), 
    num_ouro int not null,
    num_prata int not null, 
    num_bronze int not null, 
    num_camp_participados int not null,
    --<restrições>
    constraint nadadores_fk foreign key(numero_matricula) references pessoas_inscritas(numero_matricula)
);

select * from nadadores ;

insert into nadadores (numero_matricula, dt_inscricao, sexo, dt_nasc, email, num_ouro, num_prata, num_bronze, num_camp_participados) values(987612, '2020-12-07', 2, '1991-01-01', 'laura.fernandes@email.com', 8, 5, 2, 10);
insert into nadadores (numero_matricula, dt_inscricao, sexo, dt_nasc, email, num_ouro, num_prata, num_bronze, num_camp_participados) values(876123, '2020-08-30', 1,'1998-02-15', 'rafael.costa@email.com', 3, 4, 1, 6);
insert into nadadores (numero_matricula, dt_inscricao, sexo, dt_nasc, email, num_ouro, num_prata, num_bronze, num_camp_participados) values(765123, '2020-05-09', 1, '1986-05-02', 'juliana.santos@email.com', 2, 4, 5, 8);
insert into nadadores (numero_matricula, dt_inscricao, sexo, dt_nasc, email, num_ouro, num_prata, num_bronze, num_camp_participados) values(654123, '2020-10-20', 1, '2001-09-17', 'marcelo.almeida@email.com', 5,2,5,6 );
insert into nadadores (numero_matricula, dt_inscricao, sexo, dt_nasc, email, num_ouro, num_prata, num_bronze, num_camp_participados) values(543123, '2020-11-15', 2, '1999-12-22',  'carolina.lima@email.com',4,6,5,9 );



CREATE TABLE IF NOT EXISTS public.telefones
(
    numero_matricula int not null,
    num_telefone varchar(11),
    tipo varchar(15),
    --<restrições>
    constraint telefones_fk foreign key(numero_matricula) references pessoas_inscritas(numero_matricula),
    constraint telefones_un unique(num_telefone)
);

select * from telefones ;

Insert into telefones (numero_matricula, num_telefone, tipo) values (987612, 61678901234, 'celular');
Insert into telefones (numero_matricula, num_telefone, tipo) values (987612,6178901234 , 'contato');
Insert into telefones (numero_matricula, num_telefone, tipo) values (876123, 71890123456 , 'celular');
Insert into telefones (numero_matricula, num_telefone, tipo) values (876123, 7190123456, 'contato');
Insert into telefones (numero_matricula, num_telefone, tipo) values (765123, 81901234567, 'celular');
Insert into telefones (numero_matricula, num_telefone, tipo) values (765123, 8101234567, 'contato');
Insert into telefones (numero_matricula, num_telefone, tipo) values (654123, 91012345678, 'celular');
Insert into telefones (numero_matricula, num_telefone, tipo) values (654123, 9112345678, 'contato');
Insert into telefones (numero_matricula, num_telefone, tipo) values (543123, 31234567890, 'celular');
Insert into telefones (numero_matricula, num_telefone, tipo) values (543123, 3134567890, 'contato');




CREATE TABLE IF NOT EXISTS public.treinador
(
    numero_matricula int not null,
    form_academica varchar(50), 
    numero_titulos int not null,
    --<restrições>
    constraint treinador_fk foreign key(numero_matricula) references pessoas_inscritas(numero_matricula)
);


insert into treinador (numero_matricula, form_academica, numero_titulos) values(153276, 'Educacão Física', 4 );
insert into treinador (numero_matricula, form_academica, numero_titulos) values(715632, 'Educacão Física', 2 );
insert into treinador (numero_matricula, form_academica, numero_titulos) values(546802, 'Educacão Física', 3 );


select * from treinador ;



CREATE TABLE IF NOT EXISTS public.equipe
(
    codigo_equipe int not null, 
    nome_equipe varchar(50), 
    cidade_sede varchar(200), 
    data_fundacao date not null, 
    num_campeonatos_disputados int not null, 
    num_titulos_conquistados int not null,
    --<restrições>
    constraint equipe_pk primary key(codigo_equipe)
);

select * from equipe;


insert into equipe (codigo_equipe, nome_equipe , cidade_sede , data_fundacao , num_campeonatos_disputados , num_titulos_conquistados) values(003, 'Tubarões Aquáticos', 'Florianópolis-SC', '2019-03-05', 5, 3);
insert into equipe (codigo_equipe, nome_equipe , cidade_sede , data_fundacao , num_campeonatos_disputados , num_titulos_conquistados) values(002, 'Nadadores Velozes', 'Belo Horizonte-MG', '2017-05-05', 8, 4);
insert into equipe (codigo_equipe, nome_equipe , cidade_sede , data_fundacao , num_campeonatos_disputados , num_titulos_conquistados) values(001, 'Ondas Vivas', 'Recife-PE', '2019-02-04', 7, 2);



CREATE TABLE IF NOT EXISTS public.provas
(
    codigo_prova int not null, 
    codigo_estilo int not null, 
    distancia int not null, 
    sexo smallint not null,
    --<restrições>
    constraint provas_pk primary key(codigo_prova)
);

insert into provas (codigo_prova, codigo_estilo, distancia, sexo) values(152237, 654342, '50', 2);
insert into provas (codigo_prova, codigo_estilo, distancia, sexo) values(152431, 427682, '100', 1);
insert into provas (codigo_prova, codigo_estilo, distancia, sexo) values(152734, 765391, '400', 2);
insert into provas (codigo_prova, codigo_estilo, distancia, sexo) values(152538, 896539, '200', 1);

--adicionar após a criação da tabela estilos
ALTER TABLE public.provas
ADD CONSTRAINT provas_fk
FOREIGN KEY (codigo_estilo)
REFERENCES estilos(codigo_estilo)

select * from provas;


CREATE TABLE IF NOT EXISTS public.estilos
(
    codigo_estilo int not null, 
    nome_estilo varchar(50),
    --<restrições>
    constraint estilos_pk primary key(codigo_estilo)
);


Insert into estilos (codigo_estilo, nome_estilo) values (654342, 'borboleta');
Insert into estilos (codigo_estilo, nome_estilo) values (427682, 'costas');
Insert into estilos (codigo_estilo, nome_estilo) values (765391, 'peito');
Insert into estilos (codigo_estilo, nome_estilo) values (896539, 'livre');

select * from estilos;


CREATE TABLE IF NOT EXISTS public.prova_edicoes
(
    cod_campeonato int not null, 
    ano_edicao int not null, 
    codigo_prova int not null,
    --<restrições>
    constraint prova_edicoes_fk foreign key(cod_campeonato) references campeonatos(cod_campeonato),
    constraint prova_edicoes_cod_fk foreign key(codigo_prova) references provas(codigo_prova)
);	

--adicionar após a criação da tabela edicoes
ALTER TABLE public.prova_edicoes
ADD CONSTRAINT prova_edicoes_ano_fk
FOREIGN KEY (ano_edicao)
REFERENCES edicoes(ano_edicao);

insert into prova_edicoes (cod_campeonato,ano_edicao,codigo_prova) values (315539,2021,152237);
insert into prova_edicoes (cod_campeonato,ano_edicao,codigo_prova) values (426623,2022,152431);
insert into prova_edicoes (cod_campeonato,ano_edicao,codigo_prova) values (482691,2023,152734);


select * from prova_edicoes;


CREATE TABLE IF NOT EXISTS public.campeonatos
(
    nome_campeonato varchar(200) , 
    cod_campeonato int not null,
    --<restrições>
    constraint campeonatos_pk primary key(cod_campeonato)
);

insert into campeonatos (nome_campeonato, cod_campeonato) values('Campeonato Brasileiro Aquático', 315539);
insert into campeonatos (nome_campeonato, cod_campeonato) values('Campeonato Marcelina Cunha', 426623);
insert into campeonatos (nome_campeonato, cod_campeonato) values('Campeonato Sulamericano', 482691);

select * from campeonatos;


CREATE TABLE IF NOT EXISTS public.edicoes
(
    ano_edicao int not null, 
    data_inicio date not null, 
    data_termino date not null, 
    cidade_sede varchar(200),
    cod_campeonato int not null,
    --<restrições>
    constraint edicoes_pk primary key(ano_edicao),
    constraint edicoes_ano_fk foreign key(cod_campeonato) references campeonatos(cod_campeonato)
);

insert into edicoes (ano_edicao , data_inicio , data_termino , cidade_sede, cod_campeonato) values(2021, '2021-02-01', '2023-03-01', 'Rio de Janeiro- RJ', 315539);
insert into edicoes (ano_edicao , data_inicio , data_termino , cidade_sede, cod_campeonato) values(2022, '2022-03-15', '2022-04-15', 'São José dos Campos- SP', 426623);
insert into edicoes (ano_edicao , data_inicio , data_termino , cidade_sede, cod_campeonato) values(2023, '2023-03-02', '2023-04-02', 'Petrolina - PE', 482691);

select * from edicoes;



CREATE TABLE IF NOT EXISTS public.baterias
(
    cod_campeonato int not null, 
    codigo_prova int not null, 
    ano_edicao int not null, 
    tipo_bateria varchar(100), 
    data_bateria date not null, 
    hora_bateria time not null, 
    status_nadador varchar(50), 
    tempo_chegada numeric not null, 
    lugar_chegada int not null,
    -- <restrições>
    constraint baterias_campeonato_fk foreign key(cod_campeonato) references campeonatos(cod_campeonato),
    constraint baterias_edicao_fk foreign key(ano_edicao) references edicoes(ano_edicao),
    constraint baterias_prova_fk foreign key(codigo_prova) references provas(codigo_prova)
);


insert into public.baterias (cod_campeonato, codigo_prova, ano_edicao, tipo_bateria, data_bateria, hora_bateria, status_nadador, tempo_chegada, lugar_chegada) values (315539, 152237, 2021, 'Rio de Janeiro', '2021-02-05', '8:30', 'presente', 2, 2);
insert into public.baterias (cod_campeonato, codigo_prova, ano_edicao, tipo_bateria, data_bateria, hora_bateria, status_nadador, tempo_chegada, lugar_chegada) values (426623, 152431, 2022, 'São José dos Campos- SP', '2022-04-02', '14:30', 'presente', 2, 1);
insert into public.baterias (cod_campeonato, codigo_prova, ano_edicao, tipo_bateria, data_bateria, hora_bateria, status_nadador, tempo_chegada, lugar_chegada) values (482691, 152734, 2023, 'Petrolina - PE', '2023-04-02', '15:30', 'presente', 4, 3);


select * from baterias;



CREATE TABLE IF NOT EXISTS public.nadadores_baterias
(
    numero_matricula int not null, 
    cod_campeonato int not null, 
    tempo_chegada time not null,
    ano_edicao int not null, 
    codigo_prova int not null, 
    classificacao int not null, 
    lugar_chegada int not null, 
    status_nadador varchar(50), 
    recorde time not null,
    -- <restrições>
    constraint nadadores_baterias_matricula_fk foreign key(numero_matricula) references pessoas_inscritas(numero_matricula),
    constraint nadadores_baterias_campeonato_fk foreign key(cod_campeonato) references campeonatos(cod_campeonato),
    constraint nadadores_baterias_edicao_fk foreign key(ano_edicao) references edicoes(ano_edicao),
    constraint nadadores_baterias_prova_fk foreign key(codigo_prova) references provas(codigo_prova)
);


insert into public.nadadores_baterias (numero_matricula, cod_campeonato, tempo_chegada, ano_edicao, codigo_prova, classificacao, lugar_chegada, status_nadador, recorde)
 values (987612, 315539, '02:00', 2021, 152237, 2, 2, 'presente', '01:00');
insert into public.nadadores_baterias (numero_matricula, cod_campeonato, tempo_chegada, ano_edicao, codigo_prova, classificacao, lugar_chegada, status_nadador, recorde)
 values (876123, 426623, '01:00', 2022, 152431, 1, 1, 'presente', '01:00');
insert into public.nadadores_baterias (numero_matricula, cod_campeonato, tempo_chegada, ano_edicao, codigo_prova, classificacao, lugar_chegada, status_nadador, recorde)
 values (765123, 482691, '03:00', 2023, 152538, 3, 3, 'presente', '02:00');


select *from nadadores_baterias;


