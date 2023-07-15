WITH
    fonte_ordem_detalhes AS (
        SELECT
            cast(order_id AS int) AS id_pedido
            , cast(product_id AS int) AS id_produto
            , cast(discount AS numeric) AS desconto_perc
            , cast(unit_price AS numeric) AS preco_da_unidade
            , cast(quantity AS int) AS quantidade
        FROM {{ source('erp', 'order_details') }}
    )
    
SELECT *
FROM fonte_ordem_detalhes