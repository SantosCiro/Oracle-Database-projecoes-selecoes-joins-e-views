-- Digite com o comando abaixo para mostrar todos os campos da tabela TABELA_DE_CLIENTES:

SELECT
    *
FROM
    tabela_de_clientes;

-- Execute o comando abaixo para mostrar somente os quatro campos.

SELECT
    cpf,
    nome,
    bairro,
    cidade
FROM
    tabela_de_clientes;

-- Trocando a ordem de visualização dos campos, execute o código:

SELECT
    nome,
    cpf,
    cidade,
    bairro
FROM
    tabela_de_clientes;

-- Use alias para alterar o nome do campo ao ser mostrado. Execute o código:

SELECT
    cpf  AS identificador,
    nome AS "NOME DE CLIENTE",
    bairro,
    cidade
FROM
    tabela_de_clientes;

-- Para dar um Alias para a tabela, execute o comando:

SELECT
    cpf  AS identificador,
    nome AS "NOME DE CLIENTE",
    tdc.bairro,
    cidade
FROM
    tabela_de_clientes tdc;

-- Associe uma tabela para um Alias:

SELECT
    tdc.*
FROM
    tabela_de_clientes tdc;

-- Para ver todas as linhas da tabela, execute o comando:

SELECT
    *
FROM
    tabela_de_produtos;

-- Execute o comando com o filtro WHERE 1=1:

SELECT
    *
FROM
    tabela_de_produtos
WHERE
    1 = 1;

-- Para mostrar a linha com o determinado código, execute o comando:

SELECT
    *
FROM
    tabela_de_produtos
WHERE
    codigo_do_produto = '290478';

-- Para mostrar um conjunto de campos, execute:

SELECT
    *
FROM
    tabela_de_produtos
WHERE
    sabor = 'Laranja';

-- Use o filtro no campo EMBALAGEM:

SELECT
    *
FROM
    tabela_de_produtos
WHERE
    embalagem = 'PET';

-- O comando é case sensitive, então não funcionará:

SELECT
    *
FROM
    tabela_de_produtos
WHERE
    embalagem = 'pet';

-- Execute o comando:

SELECT
    *
FROM
    tabela_de_clientes;

-- Para usar o filtro quantitativo, mostre clientes com mais de 20 anos:

SELECT
    *
FROM
    tabela_de_clientes
WHERE
    idade > 20;

-- Execute o comando abaixo para mostrar os clientes com menos de 20 anos:

SELECT
    *
FROM
    tabela_de_clientes
WHERE
    idade < 20;

-- Para mostrar os clientes que não tem 18 anos, execute o comando:

SELECT
    *
FROM
    tabela_de_clientes
WHERE
    idade <> 18;

-- Use datas para filtrar os registros que serão exibidos:

SELECT
    *
FROM
    tabela_de_clientes
WHERE
    data_de_nascimento >= '14/11/95';

-- Para explicitar a data, execute o comando:

SELECT
    *
FROM
    tabela_de_clientes
WHERE
    data_de_nascimento >= TO_DATE('14/11/1995', 'DD/MM/YYYY');

-- Usando a notação americana, execute o comando:

SELECT
    *
FROM
    tabela_de_clientes
WHERE
    data_de_nascimento >= TO_DATE('11/14/1995', 'MM/DD/YYYY');

-- Se quiser mostrar dados entre limites, execute BETWEEN:

SELECT
    *
FROM
    tabela_de_clientes
WHERE
    idade BETWEEN 17 AND 22;

-- Execute o comando abaixo para mostrar os registros com letras em ordem alfabética depois de Lapa:

SELECT
    *
FROM
    tabela_de_clientes
WHERE
    bairro >= 'Lapa';

-- Entre com os comandos para verificar o uso das expressões lógicas:

SELECT
    *
FROM
    tabela_de_produtos
WHERE
    sabor = 'Manga'
    OR tamanho = '470 ml';

SELECT
    *
FROM
    tabela_de_produtos
WHERE
        sabor = 'Manga'
    AND tamanho = '470 ml';

-- Use o NOT com as expressões lógicas:

SELECT
    *
FROM
    tabela_de_produtos
WHERE
    NOT ( sabor = 'Manga'
          AND tamanho = '470 ml' );

SELECT
    *
FROM
    tabela_de_produtos
WHERE
    NOT ( sabor = 'Manga'
          OR tamanho = '470 ml' );

-- Os comandos seguintes são equivalentes:

SELECT
    *
FROM
    tabela_de_produtos
WHERE
    sabor = 'Manga'
    OR sabor = 'Laranja'
    OR sabor = 'Melancia';

SELECT
    *
FROM
    tabela_de_produtos
WHERE
    sabor IN ( 'Manga', 'Laranja', 'Melancia' );

-- Junte o IN com outra expressão lógica AND:

SELECT
    *
FROM
    tabela_de_produtos
WHERE
    sabor IN ( 'Manga', 'Laranja', 'Melancia' )
    AND tamanho = '1 Litro';

-- Acompanhe as explicações dos comandos lógicos aplicados à tabela TABELA_DE_CLIENTES:

SELECT
    *
FROM
    tabela_de_clientes;

SELECT
    *
FROM
    tabela_de_clientes
WHERE
    cidade IN ( 'Rio de Janeiro', 'Sao Paulo' )
    AND idade >= 20;

SELECT
    *
FROM
    tabela_de_clientes
WHERE
    cidade IN ( 'Rio de Janeiro', 'Sao Paulo' )
    AND ( idade >= 20
          AND idade <= 25 );

SELECT
    *
FROM
    tabela_de_clientes
WHERE
    cidade IN ( 'Rio de Janeiro', 'Sao Paulo' )
    AND ( idade BETWEEN 20 AND 25 );

-- Para ver todos os sabores que tem Lima/Limao ou Morango/Limao, execute o comando:

SELECT
    *
FROM
    tabela_de_produtos
WHERE
    sabor IN ( 'Lima/Limao', 'Morango/Limao' );

-- Para ver todos os sabores que tem Limao no sabor, execute o comando:

SELECT
    *
FROM
    tabela_de_produtos
WHERE
    sabor LIKE '%Limao';

-- Use o % nos comandos para buscar os registros com SABOR de Maca:

SELECT
    *
FROM
    tabela_de_produtos
WHERE
    sabor LIKE '%Maca%';

--  Ao usar o % junto com o comando LIKE, podem ser mostrados resultados diferentes:

SELECT
    *
FROM
    tabela_de_produtos
WHERE
    sabor LIKE 'Morango%';

SELECT
    *
FROM
    tabela_de_produtos
WHERE
    sabor LIKE '%Morango';

-- O AND pode ser usado junto com o LIKE, como no comando:

SELECT
    *
FROM
    tabela_de_produtos
WHERE
    sabor LIKE 'Morango%'
    AND embalagem = 'PET';