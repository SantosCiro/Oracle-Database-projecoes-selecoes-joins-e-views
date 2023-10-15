-- No Oracle SQL Developer, abra outra janela de script e execute o código para mostrar o nome dos clientes:

SELECT
    nome
FROM
    tabela_de_clientes;

-- Para mostrar os nomes em caixa baixa, use o comando LOWER:

SELECT
    nome,
    lower(nome)
FROM
    tabela_de_clientes;

-- Use UPPER para mostrar os caracteres em maiúsculo:

SELECT
    nome,
    lower(nome),
    upper(nome)
FROM
    tabela_de_clientes;

-- A função INITCAP coloca cada letra inicial em maiúscula:

SELECT
    nome_do_produto,
    initcap(nome_do_produto)
FROM
    tabela_de_produtos;

-- Para mostrar a rua e bairro de cada registro, execute:

SELECT
    endereco_1,
    bairro
FROM
    tabela_de_clientes;

-- Para concatenar campos do registro, use o comando CONCAT:

SELECT
    endereco_1,
    bairro,
    concat(concat(endereco_1, ' '),
           bairro)
FROM
    tabela_de_clientes;

-- Para concatenar vários campos e mostrar o endereço completo, execute:

SELECT
    endereco_1
    || ' '
    || bairro
    || ' '
    || cidade
    || ' '
    || estado
    || ' - '
    || cep
FROM
    tabela_de_clientes;

-- Use o comando LPAD para preencher espaços:

SELECT
    nome_do_produto,
    lpad(nome_do_produto, 70, '*')
FROM
    tabela_de_produtos;

-- O comando RPAD coloca os asteriscos do lado direito:

SELECT
    nome_do_produto,
    rpad(nome_do_produto, 70, '*')
FROM
    tabela_de_produtos;

-- O comando SBUSTR mostra o subtexto de uma string:

SELECT
    nome_do_produto,
    substr(nome_do_produto, 3, 5)
FROM
    tabela_de_produtos;

-- Para mostrar quais registros possuem Campo, use o comando INSTR:

SELECT
    nome_do_produto,
    instr(nome_do_produto, 'Campo')
FROM
    tabela_de_produtos;

-- Mostre quais registros possuem a palavra Mattos:

SELECT
    nome,
    instr(nome, 'Mattos')
FROM
    tabela_de_clientes;

-- Use filtro para mostrar os nomes com Mattos:

SELECT
    nome
FROM
    tabela_de_clientes
WHERE
    instr(nome, 'Mattos') <> 0;

-- O LTRIM é usado para remover os caracteres de espaço da extremidade esquerda da palavra:

SELECT
    '    VICTORINO   '        AS x,
    ltrim('    VICTORINO   ') AS y
FROM
    dual;

-- Usando o RTRIM e TRIM, você terá:

SELECT
    '    VICTORINO   '        AS x,
    ltrim('    VICTORINO   ') AS y,
    rtrim('    VICTORINO   ') AS z,
    TRIM('    VICTORINO   ')  AS w
FROM
    dual;

-- O comando REPLACE substitui strings quando mostra os resultados:

SELECT
    nome_do_produto,
    replace(replace(nome_do_produto, 'Litro', 'L'),
            'Ls',
            'L')
FROM
    tabela_de_produtos;

-- Crie um novo script e mostre a data do computador:

SELECT
    sysdate
FROM
    dual;

-- Use a função TO_CHAR para mudar o formato da data:

SELECT
    to_char(sysdate, 'DD/MM/YYYY HH:MI:SS')
FROM
    dual;

-- Mostre o nome e data de nascimento da tabela dos clientes:

SELECT
    nome,
    data_de_nascimento
FROM
    tabela_de_clientes;

-- Use o TO_CHAR para mudar o formato da data:

SELECT
    nome,
    to_char(data_de_nascimento, 'DD MONTH YYYY, DAY')
FROM
    tabela_de_clientes;

-- Para adicionar números a uma data, use a função SYSDATE:

SELECT
    sysdate + 127
FROM
    dual;

-- Para fazer operações entre datas, execute:

SELECT
    nome,
    idade,
    to_char(data_de_nascimento, 'DD MONTH YYYY, DAY')
FROM
    tabela_de_clientes;

-- Para mostrar a idade, execute:

SELECT
    nome,
    idade,
    ( sysdate - data_de_nascimento ) / 365
FROM
    tabela_de_clientes;

-- Para mostrar o número de anos, use o comando MONTHS_BETWEEN:

SELECT
    nome,
    idade,
    months_between(sysdate, data_de_nascimento) / 12
FROM
    tabela_de_clientes;

-- Use o comando ADD_MONTHS para calcular o vencimento das faturas:

SELECT
    add_months(sysdate, 10)
FROM
    dual;

-- O comando NEXT_DAY mostra a próxima data:

SELECT
    sysdate,
    next_day(sysdate, 'SEXTA')
FROM
    dual;

-- Para mostrar o último dia, use LAST_DAY:

SELECT
    sysdate,
    last_day(sysdate)
FROM
    dual;

-- Com o comando TRUNC, mostre o primeiro dia do mês da data especificada:

SELECT
    sysdate + 200,
    trunc(sysdate + 200, 'MONTH')
FROM
    dual;

-- Use o comando ROUND com YEAR para mostrar o primeiro dia do próximo ano:

SELECT
    sysdate,
    round(sysdate, 'YEAR')
FROM
    dual;

--  Crie um novo script e use o comando FROM DUAL:

SELECT
    3.4
FROM
    dual;

-- Use o comando ROUND e veja o seu uso, arredondando a resposta:

SELECT
    round(3.4)
FROM
    dual;

SELECT
    round(3.6)
FROM
    dual;

SELECT
    round(3.5)
FROM
    dual;

-- O comando CEIL é usado para retornar o menor inteiro maior que o número:

SELECT
    ceil(3.4)
FROM
    dual;

SELECT
    ceil(3.6)
FROM
    dual;

SELECT
    ceil(3.5)
FROM
    dual;

-- O comando POWER eleva o primeiro número pelo segundo:

SELECT
    power(10, 4)
FROM
    dual;

SELECT
    power(34, 4)
FROM
    dual;

-- O EXP faz o exponencial do número:

SELECT
    exp(4)
FROM
    dual;

--  O comando SQRT mostra a raiz quadrada do número:

SELECT
    sqrt(144)
FROM
    dual;

SELECT
    sqrt(10)
FROM
    dual;

-- O comando ABS retorna o valor absoluto (positivo):

SELECT
    abs(10)
FROM
    dual;

SELECT
    abs(- 10)
FROM
    dual;

-- O comando MOD exibe o resto da divisão de um valor por outro:

SELECT
    mod(10, 6)
FROM
    dual;

-- Crie um script novo e execute o código EXTRACT, para para converter as datas:

SELECT
    EXTRACT(MONTH FROM TO_DATE('12/11/2019', 'DD/MM/YYYY'))
FROM
    dual;

SELECT
    EXTRACT(MONTH FROM TO_DATE('12/11/2019', 'MM/DD/YYYY'))
FROM
    dual;

-- Para converter o caractere 10 para o número 10, use o TO_NUMBER:

SELECT
    TO_NUMBER('10') + 10
FROM
    dual;

-- Para converter número para caractere, use TO_CHAR:

SELECT
    to_char(1234.123, '9999')
FROM
    dual;

SELECT
    to_char(1234.123, '9999,999')
FROM
    dual;

-- Use o comando NVL para substituir o valor NULL por outro valor:

SELECT
    nvl(10, 0)
FROM
    dual;

SELECT
    nvl(NULL, 0)
FROM
    dual;

-- Use NVL com comandos FULL JOIN:

SELECT
    nvl(tv.nome, 'NÃO ENCONTRADO')   AS nome_vendedor,
    nvl(tv.bairro, 'NÃO ENCONTRADO') AS nome_bairro_vendedor,
    nvl(tc.nome, 'NÃO ENCONTRADO')   AS nome_cliente,
    nvl(tc.bairro, 'NÃO ENCONTRADO') AS nome_bairro_cliente
FROM
    tabela_de_vendedores tv
    FULL JOIN tabela_de_clientes   tc ON tv.bairro = tc.bairro;