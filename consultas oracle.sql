-- filtar dependentes 

SELECT c.nome as nome_colaborador, d.nome as nome_dependente,
d.data_nascimento, d.parentesco FROM brh.dependente d
INNER JOIN brh.colaborador c
ON d.colaborador = c.matricula
WHERE TO_CHAR(d.data_nascimento, 'MM') IN (04, 05, 06)
OR d.nome LIKE '%h%'
ORDER BY c.nome, d.nome;


-- maior salario

SELECT nome, salario AS maior_salario FROM brh.colaborador
WHERE salario = (SELECT MAX(salario) FROM brh.colaborador);


--senioridade
SELECT matricula, nome, salario, 
(CASE WHEN salario <= 3000 THEN 'Junior'
WHEN salario > 3000 AND salario <= 6000 THEN 'Pleno'
WHEN salario > 6000 AND salario <= 20000 THEN 'Senior'
ELSE 'Corpo diretor'
END) AS Senioridade 
FROM brh.colaborador order by salario;

--colaboradores em projetos

UPDATE brh.projeto    SET id = id - 4 WHERE nome != 'BI'; COMMIT; --precisei usar pois os id estavam errados

SELECT d.nome nome_departamento, p.nome nome_projeto FROM brh.departamento d
INNER JOIN brh.colaborador c ON d.sigla = c.departamento
INNER JOIN brh.atribuicao a ON c.matricula = a.colaborador
INNER JOIN brh.projeto p ON a.projeto = p.id;



--Listar faixa etária

select dep.cpf,colab.nome, to_char(dep.data_nascimento,'dd/mm/yyyy'), dep.parentesco, colab.matricula,
floor(months_between (sysdate, to_date(dep.data_nascimento))/12 )as idade,
case when months_between (sysdate, to_date(dep.data_nascimento))/12 <18 then 'Menor de idade'
else 'Maior de idade'
end as maioridade
from brh.dependente dep
inner join brh.colaborador colab
on colab.matricula = dep.colaborador
order by colab.matricula, dep.nome;


