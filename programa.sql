
--CRIAR PROCEDURE INSERE PROJETO
create or replace procedure brh.insere_projeto(

    p_nome in projeto.nome%type,
    p_responsavel in projeto.responsavel%type)
    
is 

begin
    insert into brh.projeto (nome,responsavel,inicio)
    values (p_nome,p_responsavel,sysdate);
end;






--FUNÇÃO CALCULA IDADE 

create or replace function calcula_idade (
p_data date)
return number
is
    v_data_retorno number;
begin
    select floor(months_between(to_date(sysdate),to_date(p_data))/12)
    into v_data_retorno from dual;
    return v_data_retorno;
end;

set serveroutput on

DECLARE
    v_idade NUMBER;
BEGIN
    v_idade := calcula_idade('18/06/1998');
    dbms_output.put_line('A idade é: ' || v_idade);
END;







---FUNÇÃO FIM DO PROJETO--

create or replace function brh.finaliza_projeto (
p_id number)
return date
is
    v_data_retorno date;
    v_data_anterior date;
begin
    
    
    select fim into v_data_anterior from brh.projeto where id=p_id;
    
    case 
    when v_data_anterior is null then
    update brh.projeto set fim = sysdate where id= p_id;
    select fim into v_data_retorno from brh.projeto where id=p_id;      
    
    
    else 
    select fim into v_data_retorno from brh.projeto where id=p_id;
    end case;
       
    return v_data_retorno;
end;



set serveroutput on

DECLARE
    v_id number;
    v_data_retorno date;

BEGIN
    v_data_retorno := brh.finaliza_projeto(2);
    dbms_output.put_line('A data final do projeto é : ' || v_data_retorno);
END;






-- NÃO CADASTRAR PROJETOS INVALIDOS


create or replace procedure brh.insere_projeto(

    p_nome in projeto.nome%type,
    p_responsavel in projeto.responsavel%type)
    
is 

begin

    case when length(p_nome)>=2 then
    insert into brh.projeto (nome,responsavel,inicio)
    values (p_nome,p_responsavel,sysdate);
    
    else 
    
        dbms_output.put_line('Nome de projeto inválido! Deve ter dois ou mais caracteres.');
        
    end case;
    
end;
