-- Crie um novo script e olhe a tabela de cadastro de clientes:

SELECT
    *
FROM
    tabela_de_clientes;

-- Para calcular a quantidade vendida por cliente, execute o código:

SELECT
    nf.cpf,
    nf.data_venda,
    inf.quantidade
FROM
         notas_fiscais nf
    INNER JOIN itens_notas_fiscais inf ON nf.numero = inf.numero;

-- Para agregar dentro de um mesmo mês, execute:

SELECT
    nf.cpf,
    to_char(nf.data_venda, 'MM-YYYY') AS mes_ano,
    inf.quantidade
FROM
         notas_fiscais nf
    INNER JOIN itens_notas_fiscais inf ON nf.numero = inf.numero;

-- Agrupe:

SELECT
    nf.cpf,
    to_char(nf.data_venda, 'MM-YYYY') AS mes_ano,
    SUM(inf.quantidade)               AS quantidade_total
FROM
         notas_fiscais nf
    INNER JOIN itens_notas_fiscais inf ON nf.numero = inf.numero
GROUP BY
    cpf,
    to_char(nf.data_venda, 'MM-YYYY');

-- Olhe a tabela de clientes:

SELECT
    cpf,
    nome,
    volume_de_compra
FROM
    tabela_de_clientes;

-- Junte o resultado da query da tabela de clientes com o resultado da consulta anterior, mostrando o cadastro e a quantidade total:

SELECT
    tc.cpf,
    tc.nome,
    tc.volume_de_compra,
    tv.mes_ano,
    tv.quantidade_total
FROM
         tabela_de_clientes tc
    INNER JOIN (
        SELECT
            nf.cpf,
            to_char(nf.data_venda, 'MM-YYYY') AS mes_ano,
            SUM(inf.quantidade)               AS quantidade_total
        FROM
                 notas_fiscais nf
            INNER JOIN itens_notas_fiscais inf ON nf.numero = inf.numero
        GROUP BY
            cpf,
            to_char(nf.data_venda, 'MM-YYYY')
    ) tv ON tv.cpf = tc.cpf;

-- Coloque o CASE para testar se as vendas são válidas:

SELECT
    tc.cpf,
    tc.nome,
    tc.volume_de_compra,
    tv.mes_ano,
    tv.quantidade_total,
    (
        CASE
            WHEN tc.volume_de_compra >= tv.quantidade_total THEN
                'VENDAS VÁLIDAS'
            ELSE
                'VENDAS INVÁLIDAS'
        END
    ) AS resultado
FROM
         tabela_de_clientes tc
    INNER JOIN (
        SELECT
            nf.cpf,
            to_char(nf.data_venda, 'MM-YYYY') AS mes_ano,
            SUM(inf.quantidade)               AS quantidade_total
        FROM
                 notas_fiscais nf
            INNER JOIN itens_notas_fiscais inf ON nf.numero = inf.numero
        GROUP BY
            cpf,
            to_char(nf.data_venda, 'MM-YYYY')
    ) tv ON tv.cpf = tc.cpf;

-- Agora, escolha a data que quer verificar:

SELECT
    tc.cpf,
    tc.nome,
    tc.volume_de_compra,
    tv.mes_ano,
    tv.quantidade_total,
    (
        CASE
            WHEN tc.volume_de_compra >= tv.quantidade_total THEN
                'VENDAS VÁLIDAS'
            ELSE
                'VENDAS INVÁLIDAS'
        END
    ) AS resultado
FROM
         tabela_de_clientes tc
    INNER JOIN (
        SELECT
            nf.cpf,
            to_char(nf.data_venda, 'MM-YYYY') AS mes_ano,
            SUM(inf.quantidade)               AS quantidade_total
        FROM
                 notas_fiscais nf
            INNER JOIN itens_notas_fiscais inf ON nf.numero = inf.numero
        GROUP BY
            cpf,
            to_char(nf.data_venda, 'MM-YYYY')
    ) tv ON tv.cpf = tc.cpf
WHERE
    tv.mes_ano = '02-2015';

-- O novo desafio é o ranking das vendas dos produtos por sabor e uma coluna do percentual de vendas no ano.
-- Crie um novo script e desenvolva o código para pegar as vendas totais por sabor:

SELECT
    tp.sabor,
    inf.quantidade,
    nf.data_venda
FROM
         tabela_de_produtos tp
    INNER JOIN itens_notas_fiscais inf ON tp.codigo_do_produto = inf.codigo_do_produto
    INNER JOIN notas_fiscais       nf ON inf.numero = nf.numero;

--  Melhore o código, para mostrar dentro do ano:

SELECT
    tp.sabor,
    inf.quantidade,
    EXTRACT(YEAR FROM nf.data_venda) AS ano
FROM
         tabela_de_produtos tp
    INNER JOIN itens_notas_fiscais inf ON tp.codigo_do_produto = inf.codigo_do_produto
    INNER JOIN notas_fiscais       nf ON inf.numero = nf.numero;

-- De maneira a mostrar o ranking de vendas no ano 2016, ordenando pela soma das quantidades, execute:

SELECT
    tp.sabor,
    EXTRACT(YEAR FROM nf.data_venda) AS ano,
    SUM(inf.quantidade)              AS quantidade_total
FROM
         tabela_de_produtos tp
    INNER JOIN itens_notas_fiscais inf ON tp.codigo_do_produto = inf.codigo_do_produto
    INNER JOIN notas_fiscais       nf ON inf.numero = nf.numero
WHERE
    EXTRACT(YEAR FROM nf.data_venda) = 2016
GROUP BY
    tp.sabor,
    EXTRACT(YEAR FROM nf.data_venda)
ORDER BY
    SUM(inf.quantidade) DESC;

-- Para mostrar a consulta da data e quantidade de vendas:

SELECT
    nf.data_venda,
    inf.quantidade
FROM
         notas_fiscais nf
    INNER JOIN itens_notas_fiscais inf ON nf.numero = inf.numero;

-- Altere o código para mostrar o total de vendas em litros:

SELECT
    total_ano.quantidade_geral
FROM
    (
        SELECT
            EXTRACT(YEAR FROM nf.data_venda) AS ano,
            SUM(inf.quantidade)              AS quantidade_geral
        FROM
                 notas_fiscais nf
            INNER JOIN itens_notas_fiscais inf ON nf.numero = inf.numero
        WHERE
            EXTRACT(YEAR FROM nf.data_venda) = 2016
        GROUP BY
            EXTRACT(YEAR FROM nf.data_venda)
    ) total_ano;

-- Juntando as consultas, você terá:

SELECT
    tp.sabor,
    EXTRACT(YEAR FROM nf.data_venda) AS ano,
    SUM(inf.quantidade)              AS quantidade_total,
    (
        SELECT
            total_ano.quantidade_geral
        FROM
            (
                SELECT
                    EXTRACT(YEAR FROM nf.data_venda) AS ano,
                    SUM(inf.quantidade)              AS quantidade_geral
                FROM
                         notas_fiscais nf
                    INNER JOIN itens_notas_fiscais inf ON nf.numero = inf.numero
                WHERE
                    EXTRACT(YEAR FROM nf.data_venda) = 2016
                GROUP BY
                    EXTRACT(YEAR FROM nf.data_venda)
            ) total_ano
    )                                AS quantidade_geral
FROM
         tabela_de_produtos tp
    INNER JOIN itens_notas_fiscais inf ON tp.codigo_do_produto = inf.codigo_do_produto
    INNER JOIN notas_fiscais       nf ON inf.numero = nf.numero
WHERE
    EXTRACT(YEAR FROM nf.data_venda) = 2016
GROUP BY
    tp.sabor,
    EXTRACT(YEAR FROM nf.data_venda)
ORDER BY
    SUM(inf.quantidade) DESC;

-- Para finalizar, o código completo que calcula e mostra a quantidade de vendas por sabor em determinado ano:

SELECT
    consulta_relatorio.sabor,
    consulta_relatorio.ano,
    consulta_relatorio.quantidade_total,
    round((consulta_relatorio.quantidade_total / consulta_relatorio.quantidade_geral) * 100, 2) AS percentual_participacao
FROM
    (
        SELECT
            tp.sabor,
            EXTRACT(YEAR FROM nf.data_venda) AS ano,
            SUM(inf.quantidade)              AS quantidade_total,
            (
                SELECT
                    total_ano.quantidade_geral
                FROM
                    (
                        SELECT
                            EXTRACT(YEAR FROM nf.data_venda) AS ano,
                            SUM(inf.quantidade)              AS quantidade_geral
                        FROM
                                 notas_fiscais nf
                            INNER JOIN itens_notas_fiscais inf ON nf.numero = inf.numero
                        WHERE
                            EXTRACT(YEAR FROM nf.data_venda) = 2016
                        GROUP BY
                            EXTRACT(YEAR FROM nf.data_venda)
                    ) total_ano
            )                                AS quantidade_geral
        FROM
                 tabela_de_produtos tp
            INNER JOIN itens_notas_fiscais inf ON tp.codigo_do_produto = inf.codigo_do_produto
            INNER JOIN notas_fiscais       nf ON inf.numero = nf.numero
        WHERE
            EXTRACT(YEAR FROM nf.data_venda) = 2016
        GROUP BY
            tp.sabor,
            EXTRACT(YEAR FROM nf.data_venda)
        ORDER BY
            SUM(inf.quantidade) DESC
    ) consulta_relatorio;