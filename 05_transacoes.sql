-- TRANSACAO 1: venda com baixa de estoque
BEGIN;

UPDATE estoque
SET quantidade = quantidade - 1,
    atualizado_em = CURRENT_TIMESTAMP
WHERE produto_id = 3
  AND quantidade >= 1;

INSERT INTO pedidos (cliente_id, endereco_id, cupom_id, status, frete)
VALUES (1, 1, 1, 'PAGO', 20)
RETURNING pedido_id;

-- Em um sistema real, o pedido_id retornado acima seria usado no item e pagamento.
-- Exemplo didatico usando o proximo pedido:
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario)
VALUES (16, 3, 1, 89.90);

INSERT INTO pagamentos (pedido_id, metodo, valor, status, pago_em)
VALUES (16, 'PIX', 109.90, 'APROVADO', CURRENT_TIMESTAMP);

COMMIT;


-- TRANSACAO 2: simulacao de cancelamento com ROLLBACK
BEGIN;

UPDATE pedidos
SET status = 'CANCELADO'
WHERE pedido_id = 15;

UPDATE pagamentos
SET status = 'ESTORNADO'
WHERE pedido_id = 15;

-- Mantem a base original para demonstracao do ROLLBACK.
ROLLBACK;

-- Conferencia: o pedido 15 volta ao estado anterior.
SELECT pedido_id, status FROM pedidos WHERE pedido_id = 15;
SELECT pedido_id, status FROM pagamentos WHERE pedido_id = 15;
