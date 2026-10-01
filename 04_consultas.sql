-- 10+ CONSULTAS SQL

-- 1. JOIN: pedidos com cliente
SELECT p.pedido_id, c.nome, p.data_pedido, p.status, p.frete
FROM pedidos p
JOIN clientes c ON c.cliente_id = p.cliente_id
ORDER BY p.data_pedido DESC;

-- 2. JOIN multiplo: itens vendidos
SELECT p.pedido_id, c.nome AS cliente, pr.nome AS produto,
       i.quantidade, i.preco_unitario,
       i.quantidade * i.preco_unitario AS subtotal
FROM pedidos p
JOIN clientes c ON c.cliente_id = p.cliente_id
JOIN itens_pedido i ON i.pedido_id = p.pedido_id
JOIN produtos pr ON pr.produto_id = i.produto_id
ORDER BY p.pedido_id;

-- 3. GROUP BY: faturamento por produto
SELECT pr.nome,
       SUM(i.quantidade) AS unidades,
       SUM(i.quantidade * i.preco_unitario) AS faturamento
FROM itens_pedido i
JOIN produtos pr ON pr.produto_id = i.produto_id
GROUP BY pr.produto_id, pr.nome
ORDER BY faturamento DESC;

-- 4. GROUP BY + HAVING: categorias com faturamento acima de R$ 500
SELECT cat.nome,
       SUM(i.quantidade * i.preco_unitario) AS faturamento
FROM categorias cat
JOIN produtos pr ON pr.categoria_id = cat.categoria_id
JOIN itens_pedido i ON i.produto_id = pr.produto_id
GROUP BY cat.categoria_id, cat.nome
HAVING SUM(i.quantidade * i.preco_unitario) > 500
ORDER BY faturamento DESC;

-- 5. Subconsulta: produtos acima do preco medio
SELECT nome, preco
FROM produtos
WHERE preco > (SELECT AVG(preco) FROM produtos)
ORDER BY preco DESC;

-- 6. Subconsulta correlacionada: clientes com pedidos
SELECT c.nome, c.email
FROM clientes c
WHERE EXISTS (
    SELECT 1 FROM pedidos p
    WHERE p.cliente_id = c.cliente_id
);

-- 7. Estoque abaixo do minimo
SELECT pr.nome, e.quantidade, e.estoque_minimo
FROM estoque e
JOIN produtos pr ON pr.produto_id = e.produto_id
WHERE e.quantidade < e.estoque_minimo
ORDER BY e.quantidade;

-- 8. Media das avaliacoes por produto
SELECT pr.nome,
       ROUND(AVG(a.nota),2) AS media_nota,
       COUNT(a.avaliacao_id) AS total_avaliacoes
FROM produtos pr
JOIN avaliacoes a ON a.produto_id = pr.produto_id
GROUP BY pr.produto_id, pr.nome
ORDER BY media_nota DESC;

-- 9. Pedidos pagos por forma de pagamento
SELECT metodo, COUNT(*) AS quantidade,
       SUM(valor) AS valor_total
FROM pagamentos
WHERE status = 'APROVADO'
GROUP BY metodo
ORDER BY valor_total DESC;

-- 10. LEFT JOIN: clientes sem pedidos
SELECT c.cliente_id, c.nome
FROM clientes c
LEFT JOIN pedidos p ON p.cliente_id = c.cliente_id
WHERE p.pedido_id IS NULL;

-- 11. Receita por cliente
SELECT c.nome,
       COUNT(p.pedido_id) AS pedidos,
       COALESCE(SUM(i.quantidade * i.preco_unitario),0) AS total_compras
FROM clientes c
LEFT JOIN pedidos p ON p.cliente_id = c.cliente_id
LEFT JOIN itens_pedido i ON i.pedido_id = p.pedido_id
GROUP BY c.cliente_id, c.nome
ORDER BY total_compras DESC;

-- 12. Pedidos com entrega e transportadora
SELECT p.pedido_id, c.nome AS cliente, t.nome AS transportadora,
       e.codigo_rastreio, e.status
FROM pedidos p
JOIN clientes c ON c.cliente_id = p.cliente_id
JOIN entregas e ON e.pedido_id = p.pedido_id
JOIN transportadoras t ON t.transportadora_id = e.transportadora_id
ORDER BY p.pedido_id;

-- 13. Produtos nunca avaliados
SELECT pr.nome
FROM produtos pr
LEFT JOIN avaliacoes a ON a.produto_id = pr.produto_id
WHERE a.avaliacao_id IS NULL;

-- 14. Ranking de vendas por produto
SELECT pr.nome,
       SUM(i.quantidade) AS unidades_vendidas,
       RANK() OVER (ORDER BY SUM(i.quantidade) DESC) AS ranking
FROM produtos pr
JOIN itens_pedido i ON i.produto_id = pr.produto_id
GROUP BY pr.produto_id, pr.nome;

-- 15. Valor total dos pedidos, incluindo frete
SELECT p.pedido_id, c.nome,
       SUM(i.quantidade * i.preco_unitario) + p.frete AS valor_total
FROM pedidos p
JOIN clientes c ON c.cliente_id = p.cliente_id
JOIN itens_pedido i ON i.pedido_id = p.pedido_id
GROUP BY p.pedido_id, c.nome, p.frete
ORDER BY valor_total DESC;
