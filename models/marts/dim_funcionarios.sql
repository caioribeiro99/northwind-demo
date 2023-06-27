WITH
    funcionarios AS (
        SELECT 
            id_funcionario
            , id_gerente
            , funcionario
            , funcionario_data_nascimento
            , funcionario_data_contratacao
            , funcionario_endereco
            , funcionario_cidade
            , funcionario_regiao
            , funcionario_cep
            , funcionario_pais
            , funcionario_notas
        FROM {{ ref('stg_erp__funcionarios') }}
    )

    , self_join_gerentes AS (
        SELECT
            funcionarios.id_funcionario
            , funcionarios.id_gerente
            , funcionarios.funcionario
            , gerentes.funcionario AS gerente
            , funcionarios.funcionario_data_nascimento
            , funcionarios.funcionario_data_contratacao
            , funcionarios.funcionario_endereco
            , funcionarios.funcionario_cidade
            , funcionarios.funcionario_regiao
            , funcionarios.funcionario_cep
            , funcionarios.funcionario_pais
            , funcionarios.funcionario_notas
        FROM funcionarios
        LEFT JOIN funcionarios AS gerentes ON 
            funcionarios.id_gerente = gerentes.id_funcionario
    )

    , transformacoes AS (
        SELECT
            row_number() OVER (ORDER BY id_funcionario) AS sk_funcionario
            , *
        FROM self_join_gerentes
    )

SELECT *
FROM transformacoes


