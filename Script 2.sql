-- Execute o código para ver conteúdo da tabela:

SELECT
    embalagem
FROM
    tabela_de_produtos;
    
-- Para evitar a repetição das linhas, use o DISTINCT no comando:

SELECT DISTINCT
    embalagem
FROM
    tabela_de_produtos;
    
-- Aplique um filtro no código:

SELECT DISTINCT
    embalagem
FROM
    tabela_de_produtos
WHERE
    sabor = 'Maca';
    
-- Use o DISTINCT com mais de um campo:

SELECT DISTINCT
    embalagem,
    sabor
FROM
    tabela_de_produtos;
    
-- Crie um novo script e execute o código:

SELECT
    *
FROM
    tabela_de_produtos;
    
-- Use o comando ROWNUM no código:

SELECT
    ROWNUM,
    tabela_de_produtos.*
FROM
    tabela_de_produtos;
    
-- O código abaixo tem a mesma resposta da anterior:

SELECT
    ROWNUM,
    tp.*
FROM
    tabela_de_produtos tp;
    
-- Limite o resultado para cinco linhas:

SELECT
    ROWNUM,
    tp.*
FROM
    tabela_de_produtos tp
WHERE
    ROWNUM <= 5;
    
-- Pode usar o código abaixo para o mesmo resultado:

SELECT
    tp.*
FROM
    tabela_de_produtos tp
WHERE
    ROWNUM <= 5;
    
-- O seguinte comando não funciona:

SELECT
    tp.*
FROM
    tabela_de_produtos tp
WHERE
        ROWNUM >= 2
    AND ROWNUM <= 3;
    
-- Usando o comando ORDER BY para ordenar pelo campo PRECO_DE_LISTA:

SELECT
    *
FROM
    tabela_de_produtos
ORDER BY
    preco_de_lista;
    
--  Para inverter a visualização, mostrando o valor descendente, execute:

SELECT
    *
FROM
    tabela_de_produtos
ORDER BY
    preco_de_lista DESC;
    
-- Para ordenar alfabeticamente pelo nome do produto:

SELECT
    *
FROM
    tabela_de_produtos
ORDER BY
    nome_do_produto;
    
-- Se desejar, você pode criar um ordenamento dentro de um ordenamento:

SELECT
    *
FROM
    tabela_de_produtos
ORDER BY
    embalagem,
    nome_do_produto;
    
-- Use um critério de ordenação diferente:

SELECT
    *
FROM
    tabela_de_produtos
ORDER BY
    embalagem DESC,
    nome_do_produto;
    
-- Se quiser usar os dois critérios como descendentes:

SELECT
    *
FROM
    tabela_de_produtos
ORDER BY
    embalagem DESC,
    nome_do_produto DESC;
    
-- Execute o código para visualizar a TABELA_DE_CLIENTES:

SELECT
    *
FROM
    tabela_de_clientes;
    
-- Execute o código para mostrar as linhas:

SELECT
    cidade,
    idade
FROM
    tabela_de_clientes
ORDER BY
    cidade,
    idade;
    
-- Use o DISTINCT:

SELECT DISTINCT
    cidade,
    idade
FROM
    tabela_de_clientes
ORDER BY
    cidade,
    idade;
    
-- Use o GROUP BY para visualizar dentro de determinado critério de agregação:

SELECT
    cidade,
    SUM(idade)
FROM
    tabela_de_clientes
GROUP BY
    cidade
ORDER BY
    cidade;
    
-- Some o critério de agregação em dois campos:

SELECT
    cidade,
    SUM(limite_de_credito),
    SUM(idade)
FROM
    tabela_de_clientes
GROUP BY
    cidade;
    
-- Você pode achar o produto mais caro de cada embalagem:

SELECT
    embalagem,
    MAX(preco_de_lista) AS maior_preco
FROM
    tabela_de_produtos
GROUP BY
    embalagem;
    
-- Use o comando COUNT para contar a quantidade dos produtos ordenados por embalagem.

SELECT
    embalagem,
    COUNT(*)
FROM
    tabela_de_produtos
GROUP BY
    embalagem
ORDER BY
    embalagem;

-- Você pode incluir o campo SABOR na busca:

SELECT
    embalagem,
    COUNT(*)
FROM
    tabela_de_produtos
WHERE
    sabor = 'Laranja'
GROUP BY
    embalagem
ORDER BY
    embalagem;

-- Use um Alias no GROUP BY:

SELECT
    embalagem,
    COUNT(*) AS numero_de_produtos
FROM
    tabela_de_produtos
WHERE
    sabor = 'Laranja'
GROUP BY
    embalagem
ORDER BY
    embalagem;

-- Crie uma nova janela de script e visualiza a TABELA_DE_CLIENTES:

SELECT
    *
FROM
    tabela_de_clientes;

-- Para olhar o limite de crédito por estado, execute:

SELECT
    estado,
    SUM(limite_de_credito)
FROM
    tabela_de_clientes
GROUP BY
    estado;

-- Aplique o comando HAVING:

SELECT
    estado,
    SUM(limite_de_credito)
FROM
    tabela_de_clientes
GROUP BY
    estado
HAVING
    SUM(limite_de_credito) >= 900000;

-- Para mostrar grupos de embalagem:

SELECT
    embalagem,
    MAX(preco_de_lista) AS maior_preco,
    MIN(preco_de_lista) AS menor_preco
FROM
    tabela_de_produtos
GROUP BY
    embalagem;

-- Se quiser visualizar somente produtos que custem mais do que 10 reais, use o filtro:

SELECT
    embalagem,
    MAX(preco_de_lista) AS maior_preco,
    MIN(preco_de_lista) AS menor_preco
FROM
    tabela_de_produtos
WHERE
    preco_de_lista >= 10
GROUP BY
    embalagem;

-- Use o comando HAVING para filtrar:

SELECT
    embalagem,
    MAX(preco_de_lista) AS maior_preco,
    MIN(preco_de_lista) AS menor_preco
FROM
    tabela_de_produtos
WHERE
    preco_de_lista >= 10
GROUP BY
    embalagem
HAVING
    MAX(preco_de_lista) >= 20;

-- Crie uma nova janela de script para visualizar a TABELA_DE_PRODUTOS:

SELECT
    nome_do_produto,
    preco_de_lista
FROM
    tabela_de_produtos;

-- Use o código para selecionar os registros de acordo com o vídeo:

SELECT
    nome_do_produto,
    preco_de_lista,
    (
        CASE
            WHEN preco_de_lista >= 12 THEN
                'PRODUTO CARO'
            WHEN preco_de_lista >= 7
                 AND preco_de_lista < 12 THEN
                'PRODUTO EM CONTA'
            ELSE
                'PRODUTO BARATO'
        END
    ) AS classificacao
FROM
    tabela_de_produtos
WHERE
    sabor = 'Manga';
    
-- Ordenando a visualização, você terá o código:

SELECT
    nome_do_produto,
    preco_de_lista,
    (
        CASE
            WHEN preco_de_lista >= 12 THEN
                'PRODUTO CARO'
            WHEN preco_de_lista >= 7
                 AND preco_de_lista < 12 THEN
                'PRODUTO EM CONTA'
            ELSE
                'PRODUTO BARATO'
        END
    ) AS classificacao
FROM
    tabela_de_produtos
ORDER BY
    classificacao;