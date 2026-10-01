-- ANALISE DE EXECUCAO COM EXPLAIN
-- Rode depois de executar DDL, inserts e indices.

EXPLAIN
SELECT p.pedido_id, c.nome, p.data_pedido
FROM pedidos p
JOIN clientes c ON c.cliente_id = p.cliente_id
WHERE p.cliente_id = 5
ORDER BY p.data_pedido DESC;

EXPLAIN
SELECT pr.nome, SUM(i.quantidade) AS unidades
FROM itens_pedido i
JOIN produtos pr ON pr.produto_id = i.produto_id
GROUP BY pr.produto_id, pr.nome
ORDER BY unidades DESC;

EXPLAIN
SELECT e.codigo_rastreio, e.status
FROM entregas e
WHERE e.codigo_rastreio = 'BR000000010';

-- Para um ambiente de apresentacao, EXPLAIN ANALYZE pode ser usado:
-- EXPLAIN ANALYZE SELECT ...;
-- Ele executa a consulta e apresenta custo estimado + tempo/linhas reais.
