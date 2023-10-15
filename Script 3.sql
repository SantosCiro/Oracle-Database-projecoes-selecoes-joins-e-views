-- Para visualizar a TABELA_DE_VENDEDORES, execute:

SELECT
    *
FROM
    tabela_de_vendedores;

--  Para visualizar a tabela NOTAS_FISCAIS, execute:

SELECT
    *
FROM
    notas_fiscais;

-- Para mostrar quantas notas fiscais cada vendedor vendeu, execute:

SELECT
    matricula,
    COUNT(*) AS numero_de_notas
FROM
    notas_fiscais
GROUP BY
    matricula;

-- Para ver o nome do vendedor na visualização, execute:

SELECT
    notas_fiscais.matricula,
    tabela_de_vendedores.nome,
    COUNT(*) AS numero_de_notas
FROM
         notas_fiscais
    INNER JOIN tabela_de_vendedores ON notas_fiscais.matricula = tabela_de_vendedores.matricula
GROUP BY
    notas_fiscais.matricula,
    tabela_de_vendedores.nome;

-- Acertando a ordem das tabelas, execute:

SELECT
    notas_fiscais.matricula,
    tabela_de_vendedores.nome,
    COUNT(*) AS numero_de_notas
FROM
         tabela_de_vendedores
    INNER JOIN notas_fiscais ON notas_fiscais.matricula = tabela_de_vendedores.matricula
GROUP BY
    notas_fiscais.matricula,
    tabela_de_vendedores.nome;

-- Use Alias:

SELECT
    nf.matricula,
    tv.nome,
    COUNT(*) AS numero_de_notas
FROM
         tabela_de_vendedores tv
    INNER JOIN notas_fiscais nf ON nf.matricula = tv.matricula
GROUP BY
    nf.matricula,
    tv.nome;

-- Para saber quais clientes fizeram uma compra, execute o código:

SELECT DISTINCT
    tc.cpf  AS cpf_do_cadastro,
    tc.nome AS nome_do_cliente,
    nf.cpf  AS cpf_notas_fiscais
FROM
         tabela_de_clientes tc
    INNER JOIN notas_fiscais nf ON tc.cpf = nf.cpf;

-- Quantos clientes tem no cadastro, execute:

SELECT
    COUNT(*)
FROM
    tabela_de_clientes;

-- Use o comando INSERT:

INSERT INTO tabela_de_clientes (
    cpf,
    nome,
    endereco_1,
    endereco_2,
    bairro,
    cidade,
    estado,
    cep,
    data_de_nascimento,
    idade,
    genero,
    limite_de_credito,
    volume_de_compra,
    primeira_compra
) VALUES (
    '23412632331',
    'Juliana Silva',
    'R. Tramandai',
    '',
    'Bangu',
    'Rio de Janeiro',
    'RJ',
    '23400000',
    TO_DATE('1989-02-04', 'YYYY-MM-DD'),
    28,
    'F',
    180000.0000,
    24500,
    0
);

-- Execute o código abaixo para mostrar todos os clientes:

SELECT DISTINCT
    tc.cpf  AS cpf_do_cadastro,
    tc.nome AS nome_do_cliente,
    nf.cpf  AS cpf_notas_fiscais
FROM
    tabela_de_clientes tc
    LEFT JOIN notas_fiscais      nf ON tc.cpf = nf.cpf;

-- Mostra o cliente que nunca comprou:

SELECT DISTINCT
    tc.cpf  AS cpf_do_cadastro,
    tc.nome AS nome_do_cliente,
    nf.cpf  AS cpf_notas_fiscais
FROM
    tabela_de_clientes tc
    LEFT JOIN notas_fiscais      nf ON tc.cpf = nf.cpf
WHERE
    nf.cpf IS NULL;

-- Para tirar a coluna indesejada CPF_NOTAS_FISCAIS, execute:

SELECT DISTINCT
    tc.cpf  AS cpf_do_cadastro,
    tc.nome AS nome_do_cliente
FROM
    tabela_de_clientes tc
    LEFT JOIN notas_fiscais      nf ON tc.cpf = nf.cpf
WHERE
    nf.cpf IS NULL;

-- Faça o JOIN pelo campo BAIRRO:

SELECT DISTINCT
    tv.nome   AS nome_do_vendedor,
    tv.bairro AS bairro_do_vendedor,
    tc.nome   AS nome_do_cliente,
    tc.bairro AS bairro_do_cliente
FROM
         tabela_de_clientes tc
    INNER JOIN tabela_de_vendedores tv ON tv.bairro = tc.bairro;

-- Mostre a quantidade de vendedores:

SELECT
    COUNT(*)
FROM
    tabela_de_vendedores;

-- Para mostrar o cliente onde não tem vendedor, execute:

SELECT DISTINCT
    tv.nome   AS nome_do_vendedor,
    tv.bairro AS bairro_do_vendedor,
    tc.nome   AS nome_do_cliente,
    tc.bairro AS bairro_do_cliente
FROM
    tabela_de_clientes   tc
    LEFT JOIN tabela_de_vendedores tv ON tv.bairro = tc.bairro;

-- Para saber quais são os vendedores que tem escritório onde não tem cliente, execute:

SELECT DISTINCT
    tv.nome   AS nome_do_vendedor,
    tv.bairro AS bairro_do_vendedor,
    tc.nome   AS nome_do_cliente,
    tc.bairro AS bairro_do_cliente
FROM
    tabela_de_clientes   tc
    RIGHT JOIN tabela_de_vendedores tv ON tv.bairro = tc.bairro;

-- Junte todos os casos:

SELECT DISTINCT
    tv.nome   AS nome_do_vendedor,
    tv.bairro AS bairro_do_vendedor,
    tc.nome   AS nome_do_cliente,
    tc.bairro AS bairro_do_cliente
FROM
    tabela_de_clientes   tc
    FULL JOIN tabela_de_vendedores tv ON tv.bairro = tc.bairro;

-- Crie um novo script e execute o comando abaixo:

SELECT DISTINCT
    bairro
FROM
    tabela_de_clientes;

-- Execute o comando abaixo e veja que aparecem 4 bairros:

SELECT DISTINCT
    bairro
FROM
    tabela_de_vendedores;

-- Unindo as duas consultas, você terá 13 bairros como resposta:

SELECT DISTINCT
    bairro
FROM
    tabela_de_clientes
UNION
SELECT DISTINCT
    bairro
FROM
    tabela_de_vendedores;

-- Se você usar o UNION ALL, irá aparecer como resposta 16 bairros:

SELECT DISTINCT
    bairro
FROM
    tabela_de_clientes
UNION ALL
SELECT DISTINCT
    bairro
FROM
    tabela_de_vendedores;

-- Para identificar de qual tabela está vindo a linha, execute:

SELECT DISTINCT
    bairro,
    'CLIENTE' AS origem
FROM
    tabela_de_clientes
UNION ALL
SELECT DISTINCT
    bairro,
    'FORNECEDOR' AS origem
FROM
    tabela_de_vendedores;

-- Como mais uma coluna foi adicionada, o resultado será o mesmo:

SELECT DISTINCT
    bairro,
    'CLIENTE' AS origem
FROM
    tabela_de_clientes
UNION
SELECT DISTINCT
    bairro,
    'FORNECEDOR' AS origem
FROM
    tabela_de_vendedores;

--  Crie um novo script e execute o seguinte comando:

SELECT DISTINCT
    bairro
FROM
    tabela_de_vendedores;

-- Com o código abaixo, são mostrados os clientes com sua sede em bairros onde há vendedores:

SELECT
    *
FROM
    tabela_de_clientes
WHERE
    bairro IN ( 'Tijuca', 'Jardins', 'Copacabana', 'Santo Amaro' );

-- De uma maneira melhor, você terá o código:

SELECT
    *
FROM
    tabela_de_clientes
WHERE
    bairro IN (
        SELECT DISTINCT
            bairro
        FROM
            tabela_de_vendedores
    );

-- Em um novo script, execute o código abaixo:

SELECT
    embalagem,
    SUM(preco_de_lista) AS soma_preco
FROM
    tabela_de_produtos
GROUP BY
    embalagem;

-- Use o comando HAVING para mostrar os preços acima de 80:

SELECT
    embalagem,
    SUM(preco_de_lista) AS soma_preco
FROM
    tabela_de_produtos
GROUP BY
    embalagem
HAVING
    SUM(preco_de_lista) >= 80;

-- Faça uma consulta usando a subconsulta com o WHERE:

SELECT
    soma_embalagens.embalagem,
    soma_embalagens.soma_preco
FROM
    (
        SELECT
            embalagem,
            SUM(preco_de_lista) AS soma_preco
        FROM
            tabela_de_produtos
        GROUP BY
            embalagem
    ) soma_embalagens
WHERE
    soma_embalagens.soma_preco >= 80;

-- Crie uma visão com VIEW:

CREATE VIEW vw_soma_embalagens AS
    SELECT
        embalagem,
        SUM(preco_de_lista) AS soma_preco
    FROM
        tabela_de_produtos
    GROUP BY
        embalagem;

-- Selecione registros de uma visão:

SELECT
    embalagem,
    soma_preco
FROM
    vw_soma_embalagens
WHERE
    soma_preco >= 80;

-- Para listar todos os produtos cuja soma de embalagem é maior que 80, execute o código:

SELECT
    *
FROM
         tabela_de_produtos tp
    INNER JOIN vw_soma_embalagens vw ON tp.embalagem = vw.embalagem
WHERE
    vw.soma_preco >= 80;