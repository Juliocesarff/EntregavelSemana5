-- PERMISSOES
-- Execute este arquivo com um usuario administrador do PostgreSQL.

DO $$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'ecommerce_leitura') THEN
        CREATE ROLE ecommerce_leitura LOGIN PASSWORD 'Leitura@123';
    END IF;
    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'ecommerce_operador') THEN
        CREATE ROLE ecommerce_operador LOGIN PASSWORD 'Operador@123';
    END IF;
END $$;

GRANT CONNECT ON DATABASE postgres TO ecommerce_leitura, ecommerce_operador;
GRANT USAGE ON SCHEMA public TO ecommerce_leitura, ecommerce_operador;

GRANT SELECT ON ALL TABLES IN SCHEMA public TO ecommerce_leitura;
GRANT SELECT, INSERT, UPDATE ON pedidos, itens_pedido, pagamentos, estoque
TO ecommerce_operador;

GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public
TO ecommerce_operador;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT ON TABLES TO ecommerce_leitura;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT, INSERT, UPDATE ON TABLES TO ecommerce_operador;

-- Para demonstrar REVOKE:
REVOKE DELETE ON pedidos, itens_pedido, pagamentos, estoque
FROM ecommerce_operador;
