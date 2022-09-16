SELECT d.nome nome_departamento, p.nome nome_projeto,count(*)
FROM brh.departamento d
INNER JOIN brh.colaborador c ON d.sigla = c.departamento
INNER JOIN brh.atribuicao a ON c.matricula = a.colaborador
INNER JOIN brh.projeto p ON a.projeto = p.id 
group by d.nome, p.nome
order by d.nome,p.nome;









