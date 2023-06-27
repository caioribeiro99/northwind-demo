WITH
    fonte_categories AS (
        SELECT
            cast(category_id AS int) AS id_categoria
            , cast(category_name AS string) AS nome_categoria
            , cast(description AS string) AS descricao_categoria
            --, picture
        FROM {{ source('erp', 'categories') }}
    )

SELECT *
from fonte_categories