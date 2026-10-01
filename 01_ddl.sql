-- DESAFIO SPRINT 5 - PROJETO DE BANCO DE DADOS
-- Grupo 4 - Sistema de E-commerce
-- PostgreSQL

DROP TABLE IF EXISTS avaliacoes, entregas, pagamentos, itens_pedido, pedidos,
                    estoque, produtos, cupons, transportadoras, enderecos,
                    clientes, categorias CASCADE;

CREATE TABLE categorias (
    categoria_id SERIAL PRIMARY KEY,
    nome VARCHAR(80) NOT NULL UNIQUE,
    descricao VARCHAR(200),
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    cpf CHAR(11) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    data_cadastro DATE NOT NULL DEFAULT CURRENT_DATE,
    status VARCHAR(20) NOT NULL DEFAULT 'ATIVO'
        CHECK (status IN ('ATIVO','INATIVO','BLOQUEADO'))
);

CREATE TABLE enderecos (
    endereco_id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL REFERENCES clientes(cliente_id) ON DELETE CASCADE,
    tipo VARCHAR(20) NOT NULL DEFAULT 'ENTREGA'
        CHECK (tipo IN ('ENTREGA','COBRANCA')),
    logradouro VARCHAR(150) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    cidade VARCHAR(80) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep CHAR(8) NOT NULL CHECK (cep ~ '^[0-9]{8}$'),
    principal BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE produtos (
    produto_id SERIAL PRIMARY KEY,
    categoria_id INT NOT NULL REFERENCES categorias(categoria_id),
    nome VARCHAR(150) NOT NULL,
    sku VARCHAR(30) NOT NULL UNIQUE,
    preco NUMERIC(12,2) NOT NULL CHECK (preco > 0),
    custo NUMERIC(12,2) NOT NULL CHECK (custo >= 0 AND custo <= preco),
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE estoque (
    estoque_id SERIAL PRIMARY KEY,
    produto_id INT NOT NULL UNIQUE REFERENCES produtos(produto_id) ON DELETE CASCADE,
    quantidade INT NOT NULL DEFAULT 0 CHECK (quantidade >= 0),
    estoque_minimo INT NOT NULL DEFAULT 5 CHECK (estoque_minimo >= 0),
    atualizado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE cupons (
    cupom_id SERIAL PRIMARY KEY,
    codigo VARCHAR(30) NOT NULL UNIQUE,
    percentual NUMERIC(5,2) NOT NULL CHECK (percentual > 0 AND percentual <= 100),
    validade DATE NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE transportadoras (
    transportadora_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    prazo_dias INT NOT NULL DEFAULT 5 CHECK (prazo_dias > 0)
);

CREATE TABLE pedidos (
    pedido_id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL REFERENCES clientes(cliente_id),
    endereco_id INT NOT NULL REFERENCES enderecos(endereco_id),
    cupom_id INT REFERENCES cupons(cupom_id),
    data_pedido TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) NOT NULL DEFAULT 'PENDENTE'
        CHECK (status IN ('PENDENTE','PAGO','SEPARACAO','ENVIADO','ENTREGUE','CANCELADO')),
    frete NUMERIC(10,2) NOT NULL DEFAULT 0 CHECK (frete >= 0)
);

CREATE TABLE itens_pedido (
    item_id SERIAL PRIMARY KEY,
    pedido_id INT NOT NULL REFERENCES pedidos(pedido_id) ON DELETE CASCADE,
    produto_id INT NOT NULL REFERENCES produtos(produto_id),
    quantidade INT NOT NULL CHECK (quantidade > 0),
    preco_unitario NUMERIC(12,2) NOT NULL CHECK (preco_unitario > 0),
    UNIQUE (pedido_id, produto_id)
);

CREATE TABLE pagamentos (
    pagamento_id SERIAL PRIMARY KEY,
    pedido_id INT NOT NULL UNIQUE REFERENCES pedidos(pedido_id) ON DELETE CASCADE,
    metodo VARCHAR(30) NOT NULL
        CHECK (metodo IN ('PIX','CARTAO_CREDITO','CARTAO_DEBITO','BOLETO')),
    valor NUMERIC(12,2) NOT NULL CHECK (valor > 0),
    status VARCHAR(20) NOT NULL DEFAULT 'PENDENTE'
        CHECK (status IN ('PENDENTE','APROVADO','RECUSADO','ESTORNADO')),
    pago_em TIMESTAMP
);

CREATE TABLE entregas (
    entrega_id SERIAL PRIMARY KEY,
    pedido_id INT NOT NULL UNIQUE REFERENCES pedidos(pedido_id) ON DELETE CASCADE,
    transportadora_id INT NOT NULL REFERENCES transportadoras(transportadora_id),
    codigo_rastreio VARCHAR(40) NOT NULL UNIQUE,
    data_envio DATE,
    data_entrega DATE,
    status VARCHAR(20) NOT NULL DEFAULT 'AGUARDANDO'
        CHECK (status IN ('AGUARDANDO','EM_TRANSITO','ENTREGUE','ATRASADA')),
    CHECK (data_entrega IS NULL OR data_envio IS NULL OR data_entrega >= data_envio)
);

CREATE TABLE avaliacoes (
    avaliacao_id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL REFERENCES clientes(cliente_id),
    produto_id INT NOT NULL REFERENCES produtos(produto_id),
    nota INT NOT NULL CHECK (nota BETWEEN 1 AND 5),
    comentario VARCHAR(300),
    data_avaliacao DATE NOT NULL DEFAULT CURRENT_DATE,
    UNIQUE (cliente_id, produto_id)
);
