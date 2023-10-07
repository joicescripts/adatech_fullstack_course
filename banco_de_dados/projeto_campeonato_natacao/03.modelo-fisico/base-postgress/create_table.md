```sql
CREATE TABLE IF NOT EXISTS public.pessoas_inscritas
(
    numero_matricula int not null,
    nome varchar(50) not null, 
    codigo_equipe int not null,
    --<restrições>
    constraint pessoas_inscritas_pk primary key(numero_matricula)

);
--aplicar após a criação da tabela equipe
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


CREATE TABLE IF NOT EXISTS public.telefones
(
    numero_matricula int not null,
    num_telefone varchar(11),
    tipo varchar(15),
    --<restrições>
    constraint telefones_fk foreign key(numero_matricula) references pessoas_inscritas(numero_matricula),
    constraint telefones_un unique(num_telefone)
);
 

CREATE TABLE IF NOT EXISTS public.treinador
(
    numero_matricula int not null,
    form_academica varchar(50), 
    numero_titulos int not null,
    --<restrições>
    constraint treinador_fk foreign key(numero_matricula) references pessoas_inscritas(numero_matricula)
);
 

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


CREATE TABLE IF NOT EXISTS public.provas
(
    codigo_prova int not null, 
    codigo_estilo int not null, 
    distancia int not null, 
    sexo smallint not null,
    --<restrições>
    constraint provas_pk primary key(codigo_prova)
);

--adicionar após a criação da tabela estilos
ALTER TABLE public.provas
ADD CONSTRAINT provas_fk
FOREIGN KEY (codigo_estilo)
REFERENCES estilos(codigo_estilo);



CREATE TABLE IF NOT EXISTS public.estilos
(
    codigo_estilo int not null, 
    nome_estilo varchar(50),
    --<restrições>
    constraint estilos_pk primary key(codigo_estilo)
);


CREATE TABLE IF NOT EXISTS public.prova_edicoes
(
    cod_campeonato int not null, 
    ano_edicao int not null, 
    codigo_prova int not null,
    --<restrições>
    constraint prova_edicoes_fk foreign key(cod_campeonato_prova_edicoes) references campeonatos(cod_campeonato),
    constraint prova_edicoes_fk foreign key(codigo_prova_prova_edicoes) references provas(codigo_prova),
);	


--adicionar após a criação da tabela edicoes
ALTER TABLE public.prova_edicoes
ADD CONSTRAINT prova_edicoes_ano_fk
FOREIGN KEY (ano_edicao)
REFERENCES edicoes(ano_edicao);




CREATE TABLE IF NOT EXISTS public.campeonatos
(
    nome_campeonato varchar(200) , 
    cod_campeonato int not null,
    --<restrições>
    constraint campeonatos_pk primary key(cod_campeonato)
);


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



CREATE TABLE IF NOT EXISTS public.baterias
(
    cod_campeonato int not null, 
    codigo_prova int not null, 
    ano_edição int not null, 
    tipo_bateria varchar(100), 
    data_bateria date not null, 
    hora_bateria time not null, 
    status_nadador varchar(50), 
    tempo_chegada numeric not null, 
    lugar_chegada int not null,
    --<restrições>
    constraint baterias_fk foreign key(cod_campeonato_baterias) references campeonatos(cod_campeonato),
    constraint baterias_fk foreign key(ano_edicao_baterias) references edicoes(ano_edicao),
    constraint baterias_fk foreign key(codigo_prova_baterias) references provas(codigo_prova)
);


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
    --<restrições>
    constraint nadadores_baterias_fk foreign key(numero_matricula_nadadores_baterias) references pessoas_inscritas(numero_matricula),
    constraint nadadores_baterias_fk foreign key(cod_campeonato_nadadores_baterias) references campeonatos(cod_campeonato),
    constraint nadadores_baterias_fk foreign key(ano_edicao_nadadores_baterias) references edicoes(ano_edicao),
    constraint nadadores_baterias_fk foreign key(codigo_prova_nadadores_baterias) references provas(codigo_prova)
);
	
```
