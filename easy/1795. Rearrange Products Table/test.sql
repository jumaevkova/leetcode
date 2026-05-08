-- 1795. Rearrange Products Table

DROP TABLE IF EXISTS products;

CREATE TABLE products
(
    product_id BIGSERIAL PRIMARY KEY,
    store1     BIGINT NULL,
    store2     BIGINT NULL,
    store3     BIGINT NULL
);

INSERT INTO products (product_id, store1, store2, store3)
VALUES (0, 95, 100, 105),
       (1, 70, NULL, 80);

-- SELECT product_id,
--        store
-- FROM products,
--      LATERAL UNNEST(ARRAY [store1, store2, store3]) AS store
-- WHERE store IS NOT NULL;

SELECT product_id, 'store1' AS store, store1 AS price
FROM products
WHERE store1 IS NOT NULL

UNION ALL

SELECT product_id, 'store2' AS store, store2 AS price
FROM products
WHERE store2 IS NOT NULL

UNION ALL

SELECT product_id, 'store3' AS store, store3 AS price
FROM products
WHERE store3 IS NOT NULL;
