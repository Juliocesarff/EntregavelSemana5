-- VALIDACAO DA ENTREGA
-- Quantidade de tabelas
SELECT COUNT(*) AS total_tabelas
FROM information_schema.tables
WHERE table_schema = 'public' AND table_type = 'BASE TABLE';

-- Quantidade de registros por tabela
SELECT 'categorias' tabela, COUNT(*) registros FROM categorias
UNION ALL SELECT 'clientes', COUNT(*) FROM clientes
UNION ALL SELECT 'enderecos', COUNT(*) FROM enderecos
UNION ALL SELECT 'produtos', COUNT(*) FROM produtos
UNION ALL SELECT 'estoque', COUNT(*) FROM estoque
UNION ALL SELECT 'cupons', COUNT(*) FROM cupons
UNION ALL SELECT 'transportadoras', COUNT(*) FROM transportadoras
UNION ALL SELECT 'pedidos', COUNT(*) FROM pedidos
UNION ALL SELECT 'itens_pedido', COUNT(*) FROM itens_pedido
UNION ALL SELECT 'pagamentos', COUNT(*) FROM pagamentos
UNION ALL SELECT 'entregas', COUNT(*) FROM entregas
UNION ALL SELECT 'avaliacoes', COUNT(*) FROM avaliacoes
ORDER BY tabela;

-- Verificacao de pedidos e valores
SELECT p.pedido_id, c.nome,
       SUM(i.quantidade * i.preco_unitario) AS subtotal,
       p.frete,
       SUM(i.quantidade * i.preco_unitario) + p.frete AS total
FROM pedidos p
JOIN clientes c ON c.cliente_id = p.cliente_id
JOIN itens_pedido i ON i.pedido_id = p.pedido_id
GROUP BY p.pedido_id, c.nome, p.frete
ORDER BY p.pedido_id;
