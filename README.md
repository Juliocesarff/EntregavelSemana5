[README.md](https://github.com/user-attachments/files/32926921/README.md)
# Desafio Sprint 5 — Banco de Dados PostgreSQL
## Grupo 4 — Sistema de E-commerce

### 1. Objetivo
Projeto de banco de dados relacional para simular a operação de um e-commerce, cobrindo clientes, endereços, catálogo, estoque, pedidos, pagamentos, entregas, cupons e avaliações.

### 2. Tecnologias
- PostgreSQL
- SQL
- Git/GitHub
- pgAdmin 4 ou psql

### 3. Modelo
O banco possui 12 tabelas:
1. categorias
2. clientes
3. enderecos
4. produtos
5. estoque
6. cupons
7. transportadoras
8. pedidos
9. itens_pedido
10. pagamentos
11. entregas
12. avaliacoes

Cada tabela possui 15 registros no arquivo `02_inserts.sql`.

### 4. Integridade e normalização
Foram utilizados:
- PRIMARY KEY
- FOREIGN KEY
- NOT NULL
- UNIQUE
- CHECK
- DEFAULT
- relacionamentos 1:N e 1:1
- restrições para impedir preços/quantidades inválidos
- `ON DELETE CASCADE` em relacionamentos nos quais a exclusão do registro pai deve remover dados dependentes.

### 5. Índices
O arquivo `03_indices.sql` cria índices para:
- pedidos por cliente/data;
- produtos por categoria;
- itens por pedido;
- pedidos por status;
- rastreamento de entregas;
- avaliações por produto e nota.

A justificativa é reduzir o custo de consultas frequentes por filtros, junções e ordenações.

### 6. Consultas
O arquivo `04_consultas.sql` possui 15 consultas, incluindo:
- INNER JOIN;
- LEFT JOIN;
- GROUP BY;
- HAVING;
- subconsultas;
- EXISTS;
- funções de agregação;
- janela com RANK.

### 7. Transações
O arquivo `05_transacoes.sql` demonstra:
- `BEGIN` + `COMMIT`: venda com baixa de estoque;
- `BEGIN` + `ROLLBACK`: cancelamento simulado sem persistir a alteração.

> Observação: a transação de venda usa o pedido 16, criado pelo próprio script. Se o script for executado novamente, limpe a base e rode o projeto desde o início.

### 8. Usuários e permissões
O arquivo `06_permissoes.sql` cria:
- `ecommerce_leitura`: somente leitura;
- `ecommerce_operador`: pode consultar e alterar as tabelas operacionais.

Também há exemplos de `GRANT`, `REVOKE` e permissões padrão.

### 9. EXPLAIN
O arquivo `07_explain.sql` contém análises com `EXPLAIN` para consultas com JOIN, agregação e busca por rastreio.

O `EXPLAIN` permite observar como o PostgreSQL pretende executar a consulta, incluindo operações como Index Scan, Seq Scan, Sort, Hash Join e custos estimados.

### 10. Ordem para executar
No pgAdmin/Query Tool ou no psql:

```text
01_ddl.sql
02_inserts.sql
03_indices.sql
04_consultas.sql
05_transacoes.sql
06_permissoes.sql
07_explain.sql
```

### 11. Estrutura do GitHub

```text
sprint5-ecommerce-postgresql/
├── 01_ddl.sql
├── 02_inserts.sql
├── 03_indices.sql
├── 04_consultas.sql
├── 05_transacoes.sql
├── 06_permissoes.sql
├── 07_explain.sql
└── README.md
```

### 12. Direcionamento para o GitHub

1. Entre no GitHub e crie um novo repositório.
2. Nome sugerido: `sprint5-ecommerce-postgresql`
3. Deixe público se a faculdade exigir que o professor consiga acessar.
4. Não precisa criar os arquivos manualmente: envie os 8 arquivos desta pasta.
5. Depois de enviar, confira se o README aparece na página inicial do repositório.

### 13. Comandos Git

Depois de baixar/clonar este projeto para uma pasta:

```bash
git init
git add .
git commit -m "feat: projeto banco e-commerce sprint 5"
git branch -M main
git remote add origin https://github.com/SEU-USUARIO/sprint5-ecommerce-postgresql.git
git push -u origin main
```

Substitua `SEU-USUARIO` pelo seu usuário do GitHub.

### 14. Entrega
Antes de entregar, confirme:
- [x] PostgreSQL
- [x] 10+ tabelas
- [x] PK, FK, NOT NULL, UNIQUE, CHECK e DEFAULT
- [x] 15 registros por tabela
- [x] índices justificados
- [x] 10+ consultas
- [x] JOIN
- [x] GROUP BY
- [x] subconsultas
- [x] 2 transações
- [x] COMMIT e ROLLBACK
- [x] 2 usuários
- [x] GRANT/REVOKE
- [x] EXPLAIN
- [x] README
