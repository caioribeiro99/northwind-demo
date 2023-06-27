WITH
    fonte_fornecedores AS(
        SELECT
            cast(supplier_id AS int) AS id_fornecedor
            , cast(company_name AS string) AS nome_fornecedor
            , cast(contact_name AS string) AS contato_fornecedor
            --, contact_title
            , cast(address AS string) AS endereco_fornecedor
            , cast(postal_code AS string) AS cep_fornecedor
            , cast(city AS string) AS cidade_fornecedor
            , cast(region AS string) AS regiao_fornecedor
            , cast(country AS string) AS pais_fornecedor
            --, phone
            --, fax
            --, homepage
        FROM {{ source('erp', 'suppliers') }}
    )

SELECT *
FROM fonte_fornecedores