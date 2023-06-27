WITH
    fonte_clientes AS (
        SELECT
            cast(customer_id as string) AS id_cliente
            , cast(contact_name AS string) AS nome_cliente
            --, contact_title
            , cast(company_name AS string) AS empresa_cliente
            , cast(address AS string) AS endereco_cliente
            , cast(postal_code AS string) AS cep_cliente
            , cast(city as string) AS cidade_cliente
            , cast(region AS string) AS regiao_cliente
            , cast(country AS string) AS pais_cliente
            --, fax
            --, phone
        FROM {{ source('erp', 'customers') }}
    )

SELECT *
FROM fonte_clientes