select sigla,nome from brh.departamento;


SELECT colaborador.nome, dependente.nome, dependente.data_nascimento, dependente.parentesco
FROM brh.dependente
INNER JOIN brh.colaborador
ON dependente.colaborador = colaborador.matricula 
ORDER BY colaborador.nome , dependente.nome;



UPDATE brh.projeto SET id = id -4 where nome != 'BI' ;

select *from brh.projeto;

select *from brh.colaborador;
    
insert into brh.projeto (id,nome,responsavel,inicio,fim)
values (
9,'BI','A123','11/11/2001','18/06/2023');


insert into brh.papel (id,nome)
values (8,'Especialista de Negócios');

insert into brh.endereco (cep,uf,cidade,bairro,logradouro) values ('37795000',
'mg',
'andradas',
'gabirobal',
'rua a');

INSERT INTO brh.colaborador (matricula,cpf,nome,email_pessoal,
email_corporativo,salario,departamento,cep,complemento_endereco)
VALUES (
 'B321',
 11111,
 'Fulano de Tal',
'fulano@email.com',
'fulano.corporativo@email.com',
1200,
'SEDES',
37795000,
'ap 22'
);

insert into brh.telefone_colaborador (numero,colaborador,tipo)values (

'(61) 9 9999-9999',
'B321',
'R'

);

insert into brh.atribuicao (colaborador,projeto,papel) values (

'B321',
9,
8

);





delete from brh.atribuicao 
  where colaborador in ('H123', 'M123', 'R123', 'W123');

delete from brh.telefone_colaborador 
  where colaborador in ('H123', 'M123', 'R123', 'W123');
  
delete from brh.dependente
  where colaborador in ('H123', 'M123', 'R123', 'W123');
  
update brh.departamento 
   set chefe = 'A123'
 where sigla = 'SECAP';
 
delete from brh.colaborador 
  where departamento = 'SECAP';
  
delete from brh.departamento 
 where sigla = 'SECAP';
 
select *from brh.departamento;
  

SELECT colaborador.nome, colaborador.email_corporativo, telefone_colaborador.numero
FROM brh.colaborador
INNER JOIN brh.telefone_colaborador
ON colaborador.matricula = telefone_colaborador.colaborador;






  
select *from brh.telefone_colaborador;



