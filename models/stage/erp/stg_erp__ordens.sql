WITH    
    fonte_ordens AS (
        SELECT
            cast(order_id AS int) AS id_pedido
            , cast(employee_id AS int) AS id_funcionario
            , cast(customer_id AS string) AS id_cliente
            , cast(ship_via AS int) AS id_transportadora
            , cast(order_date AS date) AS data_do_pedido
            , cast(freight AS numeric) AS frete
            , cast(ship_name AS string) AS destinatario
            , cast(ship_address AS string) AS endereco_destinatario
            , cast(ship_postal_code AS string) AS cep_destinatario
            , cast(ship_city AS string) AS cidade_destinatario
            , cast(ship_region AS string) AS regiao_destinatario
            , cast(ship_country AS string) AS pais_destinatario
            , cast(shipped_date AS date) AS data_do_envio
            , cast(required_date AS date) AS data_requerida_entrega
        FROM {{ source('erp', 'orders') }}
    )

SELECT *
FROM fonte_ordens