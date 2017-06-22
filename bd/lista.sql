-- 01 Alterar o salário do empregado de código 3 para 28000.
UPDATE empresa.empregado 
SET salario = 2800
WHERE codemp = 3

-- 02 Obter nomes de empregados com salario > 30000.
SELECT nome FROM empresa.empregado WHERE salario > 30000;
-- 03 Obter nomes de empregados que trabalham no projeto 'Transmogrifador'.
SELECT nome FROM empresa.empregado
JOIN empresa.trabalhaem
ON empregado.codemp = trabalhaem.codemp
JOIN empresa.projeto
ON projeto.codproj = trabalhaem.codproj
WHERE titulo = 'Transmogrifador';
-- 04 Obter nomes e endereços de todos os empregados que trabalham no
-- departamento de 'Pesquisa'. Use INNER JOIN para esta consulta.
SELECT empregado.nome, empregado.endereco FROM empresa.empregado 
INNER JOIN empresa.departamento
ON empregado.coddepto = departamento.coddepto
WHERE departamento.nome = 'Pesquisa';
-- 05 Obter nomes de empregados que começam com a letra 'A'. Dica: use LIKE.
SELECT nome FROM empresa.empregado 
WHERE nome LIKE 'A%';
-- 06 Obter nome dos empregados em letra maiuscula
-- http://www.postgresql.org/docs/9.3/static/functions-string.html
SELECT upper(nome) FROM empresa.empregado;
-- 07 Obter nome dos empregados em letra maiuscula
SELECT lower(nome) FROM empresa.empregado;
-- 08 Alterar no nome dos empregados para letra maiuscula
UPDATE empresa.empregado SET nome = upper(nome);
-- 09 Obter o nome dos empregados com a letra inicial em maiusculo e as demais
--em minusculo
SELECT initcap(nome) FROM empresa.empregado;
--10 Obter o empregado mais velho
SELECT * FROM empresa.empregado
ORDER BY datanasc 
LIMIT 1;
--11 Obter o empregado mais novo
SELECT * FROM empresa.empregado
ORDER BY datanasc DESC
LIMIT 1;
-- 12 Obter os nomes e datas de nascimento dos empregados que fazem aniversário
-- no mês de outubro.
-- http://www.postgresql.org/docs/9.3/static/functions-datetime.html
SELECT nome,datanasc FROM empresa.empregado
WHERE date_part('month', datanasc) = 10;

-- 13 Obter os nomes dos empregados nascidos entre as datas 1950-01-01 e
--1970-01-01. Dica: use BETWEEN.
SELECT nome FROM empresa.empregado
WHERE datanasc BETWEEN 
'1950-01-01' AND '1970-01-01';
--14 Listar os títulos de projetos em ordem alfabética. Dica: use ORDER BY.
SELECT titulo FROM empresa.projeto
ORDER BY titulo;
--15 Listar nomes e horas trabalhadas por empregados no projeto de código 3,
-- em ordem decrescente de horas trabalhadas.
SELECT nome,horas FROM empresa.empregado
JOIN empresa.trabalhaem
ON empregado.codemp = trabalhaem.codemp
WHERE codproj = 3
ORDER BY horas;
--16 Obter códigos de empregados que trabalham mais de 10 horas em algum projeto.
--O resultado da consulta não deve ter repetições de códigos de empregados.
--Dica: use DISTINCT.
SELECT DISTINCT empregado.codemp FROM empresa.trabalhaem AS trabalhaem JOIN empresa.empregado AS empregado 
ON empregado.codemp = trabalhaem.codemp
WHERE  trabalhaem.horas>10;


-- 17 Obter a quantidade de empregados pertencentes ao departamento 4.
-- Dica: consulte funções agregadas do SQL.
SELECT COUNT (*) FROM empresa.empregado WHERE coddepto =4; 

-- 18 Obter, a partir da tabela trabalhaEm, os números mínimo, máximo e médio de
-- horas trabalhadas por empregados em cada projeto.
--O resultado deve possuir 4 colunas nomeadas: projeto, minimo, maximo e media.
--Dica: use AS para renomear os campos e GROUP BY para agrupar os resultados
-- por projeto.
SELECT projeto.titulo AS projeto, MIN(trabalhaem.horas) AS minimo, MAX(trabalhaem.horas) as maximo, 
AVG(trabalhaem.horas) AS media FROM empresa.trabalhaem JOIN empresa.projeto on trabalhaem.codproj = projeto.codproj GROUP BY projeto.titulo

-- 19 Obter os códigos de projetos cuja média de horas trabalhadas seja maior
-- que 20. Dica: use HAVING.
SELECT projeto.codproj FROM empresa.projeto AS projeto  JOIN empresa.trabalhaem AS trabalhaem GROUP BY projeto.codproj ON projeto.codproj = trabalhaem.codproj
HAVING  trabalhaem.horas >20;  
-- 20 Obter os nomes de projetos correspondentes à consulta anterior.
--Usar a consulta anterior como uma consulta aninhada à nova consulta.
--Dica: use AS para evitar ambigüidades de nomes entre as consultas.
SELECT trabalhaEm.codproj AS codProjeto,
(SELECT projeto.titulo FROM empresa.projeto
WHERE projeto.codproj = trabalhaEm.codproj)
FROM empresa.trabalhaEm
GROUP BY trabalhaEm.codproj
HAVING AVG(trabalhaEm.horas) > 20