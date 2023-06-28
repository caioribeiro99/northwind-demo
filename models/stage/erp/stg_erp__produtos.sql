WITH
    fonte_produtos AS (
        SELECT
            cast(product_id AS int) AS id_produto
            , cast(supplier_id AS int) AS id_fornecedor
            , cast(category_id AS int) AS id_categoria
            , cast(product_name AS string) AS nome_produto
            , cast(quantity_per_unit AS string) AS quantidade_por_unidade
            , cast(unit_price AS numeric) AS preco_por_unidade
            , cast(units_in_stock AS int) AS unidades_em_estoque
            , cast(units_on_order AS int) AS unidades_por_ordem
            , cast(reorder_level AS int) AS nivel_reabastecimento
            , CASE
                WHEN discontinued = 1 THEN TRUE
                ELSE FALSE
            END AS is_discontinuado
        FROM {{ source('erp', 'products') }}
    )

SELECT *
FROM fonte_produtos