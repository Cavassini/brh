select sigla, nome from departamento  /*Relatório de departamentos */
order by nome;


select colaborador.nome, dependente.nome, /*Relatório de dependentes */ 
	dependente.data_nascimento, dependente.parentesco
FROM colaborador, dependente
order by colaborador.nome, dependente.nome; 


/*Inserir novo colaborador em projeto.*/
insert into projeto values (
5, 
'BI',
'A123',
'2022-08-24',
'2023-01-01'

);


INSERT INTO papel values(

8,
'Especialista de Negócios'

);
insert into endereco values(

'37795000',
'mg',
'andradas',
'gabirobal',
'rua a'

);

INSERT INTO colaborador VALUES (
 '3762',
 11111,
 'Fulano de Tal',
'fulano@email.com',
'fulano.corporativo@email.com',
1200,
'SEDES',
37795000,
'ap 22'
);

insert into telefone_colaborador values (

'(61) 9 9999-9999',
'3762',
'R'

);

insert into atribuicao values (

'3762',
5,
8

);

/*Excluir departamento SECAP*/
delete from atribuicao 
  where colaborador in ('H123', 'M123', 'R123', 'W123');
  
delete from telefone_colaborador 
  where colaborador in ('H123', 'M123', 'R123', 'W123');
  
delete from dependente
  where colaborador in ('H123', 'M123', 'R123', 'W123');
  
update departamento 
   set chefe = 'A123'
 where sigla = 'SECAP';
 
delete from colaborador 
  where departamento = 'SECAP';
  
delete from departamento 
 where sigla = 'SECAP';