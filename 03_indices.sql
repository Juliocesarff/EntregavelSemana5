-- INDICES JUSTIFICADOS
-- Acelera busca de pedidos por cliente e ordenacao por data.
CREATE INDEX idx_pedidos_cliente_data ON pedidos (cliente_id, data_pedido DESC);

-- Acelera filtros de produtos por categoria.
CREATE INDEX idx_produtos_categoria ON produtos (categoria_id);

-- Acelera consulta de itens por pedido.
CREATE INDEX idx_itens_pedido_pedido ON itens_pedido (pedido_id);

-- Acelera busca de pedidos por status.
CREATE INDEX idx_pedidos_status ON pedidos (status);

-- Acelera consulta de entregas por codigo de rastreio.
CREATE INDEX idx_entregas_rastreio ON entregas (codigo_rastreio);

-- Acelera relatorios de avaliacoes por produto.
CREATE INDEX idx_avaliacoes_produto_nota ON avaliacoes (produto_id, nota);
