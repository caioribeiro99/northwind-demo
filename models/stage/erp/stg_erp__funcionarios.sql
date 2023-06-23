WITH
    fonte_funcionarios AS (
        SELECT *
        FROM {{ source('erp', 'employees') }}
    )

    , renomear AS (
        SELECT
             cast(employee_id AS int) AS id_funcionario
            , cast(last_name AS string) AS funcionario_sobrenome
            , cast(first_name AS string) AS funcionario_nome
            , cast(birth_date AS string) AS funcionario_data_nascimento
            , cast(hire_date AS date) AS funcionario_data_contratacao
            , cast(address AS string) AS funcionario_endereco
            , cast(city AS string) AS funcionario_cidade
            , cast(region AS string) AS funcionario_regiao
            , cast(postal_code AS string) AS funcionario_cep
            , cast(country AS string) AS funcionario_pais
            , cast(notes AS string) AS funcionario_notas
            , cast(reports_to AS int) AS id_gerente
        FROM fonte_funcionarios
    )
    
SELECT *
from renomear