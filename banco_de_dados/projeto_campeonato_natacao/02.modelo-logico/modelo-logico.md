pessoas_inscritas (numero_matricula , nome, codigo_equipe)
numero_matricula PK
codigo_equipe FK referencia equipe


nadadores (numero_matricula, dt_inscricao, sexo, dt_nasc , email , num_ouro, num_prata , num_bronze , num_camp_participados)
    numero_matricula FK referencia pessoas_inscritas
	
	
telefones (numero_matricula, num_telefone, tipo)  
    numero_matricula FK referencia pessoas_inscritas
    num_telefone UNIQUE
 

treinador (numero_matricula, form_academica, numero_titulos)
    numero_matricula FK referencia pessoas_inscritas


equipe (codigo_equipe, nome_equipe , cidade_sede , data_fundacao , num_campeonatos_disputados , num_titulos_conquistados)
	codigo_equipe PK


provas (codigo_prova, codigo_estilo, distancia, sexo)
	codigo_prova PK
 	codigo_estilo FK referencia estilos
	

estilos (codigo_estilo, nome_estilo)
    codigo_estilo PK


prova_edicoes (cod_campeonato, ano_edicao, codigo_prova)
    cod_campeonato FK referencia campeonatos
    ano_edicao FK referencia edicoes
	codigo_prova FK referencia provas


campeonatos (nome_campeonato, cod_campeonato)
	cod_campeonato PK


edicoes (ano_edicao , data_inicio , data_termino, cidade_sede, cod_campeonato)
    ano_edicao PK
    cod_campeonato FK referencia campeonatos


baterias (cod_campeonato, codigo_prova, ano_edição, tipo_bateria, data_bateria, hora_bateria, status_nadador, tempo_chegada, lugar_chegada)
    cod_campeonato FK referencia campeonatos	
    ano_edição FK referencia edicoes
	codigo_prova FK referencia provas


nadadores_baterias (numero_matricula, cod_campeonato, tempo_chegada,ano_edicao, codigo_prova, classificacao, lugar_chegada, status_nadador, recorde)
    numero_matricula FK referencia pessoas_inscritas
    cod_campeonato FK referencia campeonatos
    ano_edição FK referencia edicoes
	codigo_prova FK referencia provas
	



