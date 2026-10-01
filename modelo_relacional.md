# Modelo Relacional — Grupo 4 E-commerce

```text
categorias 1 ───── N produtos 1 ───── 1 estoque
                         │
                         └──── N itens_pedido N ───── 1 pedidos
                                                       │
clientes 1 ───── N enderecos                            │
   │                                                   │
   └──────────────────────────── N pedidos ────────────┘
                                      │
                                      ├──── 1 pagamentos
                                      ├──── 1 entregas N ───── 1 transportadoras
                                      └──── N itens_pedido

cupons 1 ───── N pedidos

clientes 1 ───── N avaliacoes N ───── 1 produtos
```

## Regras principais
- Um cliente pode possuir vários endereços e pedidos.
- Um pedido possui um ou vários itens.
- Um produto pertence a uma categoria.
- Cada produto possui um registro de estoque.
- Um pedido possui um pagamento e uma entrega.
- Uma transportadora pode atender vários pedidos.
- Um cupom pode ser aplicado a vários pedidos.
- Um cliente pode avaliar vários produtos, mas apenas uma vez cada produto.
