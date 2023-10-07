## Grupo 3 - Participantes
 - Francieli dos Reis 
 - Joice Martins 
 - Laurieny Jayne 
 - Marlon Souza
 - Matheus Santos

 # Exercícios

## Exercício 1
Encontre o preço médio arredondado com 2 casas decimais dos produtos em cada uma das categorias.
```sql


```
## Exercício 2
Busque todas as informações sobre os produtos que nunca foram comprados (inclusive a descrição da categoria e todos os dados do fornecedor).
```sql
SELECT 
    products.product_id,
   	products.product_name,
    products.description,
    products.price,
    categories.category_name,
    suppliers.supplier_id,
    suppliers.supplier_name,
    suppliers.supplier_email,
    suppliers.supplier_phone,
    suppliers.supplier_address
FROM
    products
LEFT JOIN
    categories ON products.category_id = categories.category_id
LEFT JOIN
    suppliers ON products.supplier_id = suppliers.supplier_id
LEFT JOIN
    order_items ON products.product_id = order_items.product_id
WHERE
    order_items.product_id IS NULL
FROM
    products
LEFT JOIN
    categories ON products.category_id = categories.category_id
LEFT JOIN
    suppliers ON products.supplier_id = suppliers.supplier_id
LEFT JOIN
    order_items ON products.product_id = order_items.product_id
WHERE
    order_items.product_id IS NULL;


```
## Exercício 3
Encontre os top 5 clientes que mais gastaram dinheiro em compras, exibindo o nome completo e o valor gasto formatado como dinheiro. 

Dica: Formatar como dinheiro pode ser feito assim usando o comando `CAST(xxxxxx AS MONEY)`, como em `SELECT CAST(1000 AS MONEY)`
```sql

```



## Exercício 4

Dado o modelo textual/lógico abaixo, escreva os comandos SQL para criar as tabelas, suas restrições e relações quando aplicáveis e insira pelo menos 5 registros em cada uma das tabelas.

    alunos(nome, numero_aluno, tipo_aluno, curso)

```sql
CREATE TABLE alunos(nome CHARACTER VARYING(255) NOT NULL,
numero_aluno NUMERIC(6) NOT NULL,
tipo_aluno NUMERIC(4)NOT NULL,
curso CHARACTER VARYING(10) NOT NULL,
CONSTRAINT id_aluno PRIMARY KEY (numero_aluno)
);
```

    disciplinas(nome_disciplina, numero_disciplina, creditos, departamento)

```sql
CREATE TABLE disciplinas(nome_disciplina CHARACTER VARYING(100) NOT NULL,
numero_disciplina CHARACTER VARYING(50) NOT NULL,
creditos NUMERIC (50) NOT NULL,
departamento CHARACTER VARYING(50) NOT NULL,
CONSTRAINT id_disciplina PRIMARY KEY (numero_disciplina)
);
```

    turmas(identificacao_turma, numero_disciplina, semestre, ano, professor)

```sql
CREATE TABLE turmas(identificacao_turma NUMERIC (10) NOT NULL,
numero_disciplina CHARACTER VARYING(50) NOT NULL,
semestre CHARACTER VARYING(50) NOT NULL,
ano NUMERIC (10) NOT NULL,
professor CHARACTER VARYING(255) NOT NULL,
CONSTRAINT identificacao_turma PRIMARY KEY (identificacao_turma),
CONSTRAINT numero_disciplina FOREIGN KEY (numero_disciplina) REFERENCES disciplinas(numero_disciplina)
);
```

    pre_requisitos(numero_disciplina, numero_pre_requisito)

```sql
CREATE TABLE pre_requisitos(numero_disciplina CHARACTER VARYING(50) NOT NULL,
numero_pre_requisito CHARACTER VARYING(10) NOT NULL,
CONSTRAINT numero_disciplina  FOREIGN KEY (numero_disciplina ) REFERENCES disciplinas(numero_disciplina ),
CONSTRAINT numero_pre_requisito FOREIGN KEY (numero_pre_requisito) REFERENCES disciplinas(numero_disciplina)
);

```

    historicos_escolares(numero_aluno, identificacao_turma, nota)

```sql
CREATE TABLE historicos_escolares(numero_aluno NUMERIC(6) NOT NULL,
identificacao_turma NUMERIC(10) NOT NULL,
nota CHARACTER VARYING(10) not null,
CONSTRAINT numero_aluno FOREIGN KEY (numero_aluno) REFERENCES alunos(numero_aluno),
CONSTRAINT identificacao_turma FOREIGN KEY (identificacao_turma) REFERENCES turmas(identificacao_turma)
);
```

Feito, isso, execute o comando SQL abaixo, para inserir mais registros

```sql
INSERT INTO alunos
(nome, numero_aluno, tipo_aluno, curso)
VALUES('Silva', 17, 1, 'CC');

INSERT INTO alunos
(nome, numero_aluno, tipo_aluno, curso)
VALUES('Braga', 8, 2, 'CC');

INSERT INTO disciplinas
(numero_disciplina, creditos, departamento, nome_disciplina)
VALUES('CC1310', 4, 'CC', 'Introd. à ciência da computação');

INSERT INTO disciplinas
(numero_disciplina, creditos, departamento, nome_disciplina)
VALUES('CC3320', 4, 'CC', 'Estruturas de dados');

INSERT INTO disciplinas
(numero_disciplina, creditos, departamento, nome_disciplina)
VALUES('MAT2410', 3, 'MAT', 'Matemática discreta');

INSERT INTO disciplinas
(numero_disciplina, creditos, departamento, nome_disciplina)
VALUES('CC3380', 3, 'CC', 'Banco de dados');

INSERT INTO turmas
(identificacao_turma, numero_disciplina, semestre, ano, professor)
VALUES(85, 'MAT2410', 'Segundo', 2007, 'Kleber');

INSERT INTO turmas
(identificacao_turma, numero_disciplina, semestre, ano, professor)
VALUES(92, 'CC1310', 'Segundo', 2007, 'Anderson');

INSERT INTO turmas
(identificacao_turma, numero_disciplina, semestre, ano, professor)
VALUES(102, 'CC3320', 'Primeiro', 2008, 'Carlos');

INSERT INTO turmas
(identificacao_turma, numero_disciplina, semestre, ano, professor)
VALUES(112, 'MAT2410', 'Segundo', 2008, 'Chang');

INSERT INTO turmas
(identificacao_turma, numero_disciplina, semestre, ano, professor)
VALUES(119, 'CC1310', 'Segundo', 2008, 'Anderson');

INSERT INTO turmas
(identificacao_turma, numero_disciplina, semestre, ano, professor)
VALUES(135, 'CC3380', 'Segundo', 2008, 'Santos');

INSERT INTO historicos_escolares
(numero_aluno, identificacao_turma, nota)
VALUES(17, 112, 'B');

INSERT INTO historicos_escolares
(numero_aluno, identificacao_turma, nota)
VALUES(17, 119, 'C');

INSERT INTO historicos_escolares
(numero_aluno, identificacao_turma, nota)
VALUES(8, 85, 'A');

INSERT INTO historicos_escolares
(numero_aluno, identificacao_turma, nota)
VALUES(8, 92, 'A');

INSERT INTO historicos_escolares
(numero_aluno, identificacao_turma, nota)
VALUES(8, 102, 'B');

INSERT INTO historicos_escolares
(numero_aluno, identificacao_turma, nota)
VALUES(8, 135, 'A');

INSERT INTO pre_requisitos
(numero_disciplina, numero_pre_requisito)
VALUES('CC3380', 'CC3320');

INSERT INTO pre_requisitos
(numero_disciplina, numero_pre_requisito)
VALUES('CC3380', 'MAT2410');

INSERT INTO pre_requisitos
(numero_disciplina, numero_pre_requisito)
VALUES('CC3320', 'CC1310');
```

Executar as seguintes consultas:

- Recuperar uma lista de todas as disciplinas e notas de Silva.

        R:SELECT alunos.nome, turmas.numero_disciplina, historicos_escolares.identificacao_turma, historicos_escolares.nota FROM alunos join historicos_escolares on alunos.numero_aluno = historicos_escolares.numero_aluno join turmas on historicos_escolares.identificacao_turma = turmas.identificacao_turma WHERE alunos.nome = 'Silva';

- Listar os nomes dos alunos que realizaram a disciplina Banco de dados oferecida no segundo semestre de 2008 e suas notas nessa turma.

        R:SELECT alunos.nome, historicos_escolares.nota FROM disciplinas JOIN turmas ON turmas.numero_disciplina = disciplinas.numero_disciplina JOIN historicos_escolares ON historicos_escolares.identificacao_turma = turmas.identificacao_turma join alunos ON alunos.numero_aluno = historicos_escolares.numero_aluno WHERE disciplinas.nome_disciplina = 'Banco de dados'AND turmas.ano = 2008 AND turmas.semestre = 'Segundo';

- Listar os pré-requisitos do curso de Banco de dados.

          R:SELECT pre_requisitos.numero_pre_requisito FROM pre_requisitos JOIN disciplinas ON pre_requisitos.numero_disciplina = disciplinas.numero_disciplina WHERE disciplinas.nome_disciplina = 'Banco de dados'

  Executar as seguintes atualizações no banco de dados

- Alterar o tipo de aluno de Silva para segundo ano.

        R: UPDATE tb_alunos SET tipo_aluno = 2 WHERE nome = 'Silva';

- Criar outra turma para a disciplina Banco de dados para este semestre.

        R: INSERT INTO turmas (identificacao_turma,numero_disciplina, semestre, ano, professor) VALUES (1002,'CC3380','Segundo', 2024, 'Carlos');

- Inserir uma nota A para Silva na turma Banco de dados do último semestre.

        R: INSERT INTO historicos_escolares (numero_aluno, identificacao_turma, nota) VALUES (17, 145, 'A');

&nbsp;
