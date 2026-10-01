-- 15 registros por tabela

INSERT INTO categorias (nome, descricao) VALUES
('Eletronicos','Smartphones, tablets e dispositivos'),
('Informatica','Computadores e perifericos'),
('Acessorios','Acessorios para tecnologia'),
('Audio','Fones, caixas e microfones'),
('Casa','Produtos para casa'),
('Games','Jogos e acessorios gamer'),
('Escritorio','Produtos para escritorio'),
('Celulares','Celulares e smartphones'),
('Tablets','Tablets e leitores'),
('Fotografia','Cameras e acessorios'),
('Automotivo','Acessorios automotivos'),
('Fitness','Produtos para atividade fisica'),
('Moda','Acessorios e vestuario'),
('Livros','Livros tecnicos e educacionais'),
('Smart Home','Dispositivos para casa inteligente');

INSERT INTO clientes (nome,email,cpf,telefone,status) VALUES
('Ana Souza','ana.souza@email.com','11111111101','98990000001','ATIVO'),
('Bruno Lima','bruno.lima@email.com','11111111102','98990000002','ATIVO'),
('Carla Mendes','carla.mendes@email.com','11111111103','98990000003','ATIVO'),
('Diego Costa','diego.costa@email.com','11111111104','98990000004','ATIVO'),
('Elisa Rocha','elisa.rocha@email.com','11111111105','98990000005','ATIVO'),
('Fabio Alves','fabio.alves@email.com','11111111106','98990000006','ATIVO'),
('Gabriela Silva','gabriela.silva@email.com','11111111107','98990000007','ATIVO'),
('Henrique Santos','henrique.santos@email.com','11111111108','98990000008','ATIVO'),
('Isabela Castro','isabela.castro@email.com','11111111109','98990000009','ATIVO'),
('Joao Martins','joao.martins@email.com','11111111110','98990000010','ATIVO'),
('Karen Oliveira','karen.oliveira@email.com','11111111111','98990000011','ATIVO'),
('Lucas Ferreira','lucas.ferreira@email.com','11111111112','98990000012','ATIVO'),
('Marina Nunes','marina.nunes@email.com','11111111113','98990000013','ATIVO'),
('Nicolas Pereira','nicolas.pereira@email.com','11111111114','98990000014','ATIVO'),
('Olivia Ramos','olivia.ramos@email.com','11111111115','98990000015','INATIVO');

INSERT INTO enderecos (cliente_id,tipo,logradouro,numero,cidade,estado,cep,principal) VALUES
(1,'ENTREGA','Av. Central','101','Sao Luis','MA','65000001',TRUE),
(2,'ENTREGA','Rua das Flores','202','Sao Luis','MA','65000002',TRUE),
(3,'ENTREGA','Rua do Sol','303','Sao Luis','MA','65000003',TRUE),
(4,'ENTREGA','Av. Brasil','404','Sao Luis','MA','65000004',TRUE),
(5,'ENTREGA','Rua Norte','505','Imperatriz','MA','65900005',TRUE),
(6,'ENTREGA','Rua Sul','606','Imperatriz','MA','65900006',TRUE),
(7,'ENTREGA','Av. Atlantica','707','Sao Luis','MA','65000007',TRUE),
(8,'ENTREGA','Rua Nova','808','Sao Jose de Ribamar','MA','65110008',TRUE),
(9,'ENTREGA','Rua Verde','909','Sao Luis','MA','65000009',TRUE),
(10,'ENTREGA','Av. das Palmeiras','110','Sao Luis','MA','65000010',TRUE),
(11,'ENTREGA','Rua Azul','120','Caxias','MA','65600011',TRUE),
(12,'ENTREGA','Rua Principal','130','Timon','MA','65630012',TRUE),
(13,'ENTREGA','Av. dos Lagos','140','Sao Luis','MA','65000013',TRUE),
(14,'ENTREGA','Rua do Comercio','150','Bacabal','MA','65700014',TRUE),
(15,'ENTREGA','Rua das Acacias','160','Sao Luis','MA','65000015',TRUE);

INSERT INTO produtos (categoria_id,nome,sku,preco,custo) VALUES
(1,'Smartphone Alpha 128GB','SKU001',1899.90,1400.00),
(2,'Notebook Pro 15','SKU002',3499.90,2700.00),
(3,'Mouse Sem Fio','SKU003',89.90,45.00),
(3,'Teclado Mecanico','SKU004',249.90,130.00),
(4,'Fone Bluetooth','SKU005',159.90,80.00),
(5,'Aspirador Robot','SKU006',1299.90,900.00),
(6,'Controle Gamer','SKU007',299.90,170.00),
(7,'Cadeira Escritorio','SKU008',899.90,620.00),
(8,'Smartphone Beta 256GB','SKU009',2699.90,2050.00),
(9,'Tablet 10 Polegadas','SKU010',1199.90,850.00),
(10,'Camera Digital','SKU011',2199.90,1600.00),
(11,'Suporte Veicular','SKU012',79.90,35.00),
(12,'Smartwatch Fit','SKU013',399.90,230.00),
(13,'Mochila Notebook','SKU014',199.90,100.00),
(15,'Lampada Inteligente','SKU015',129.90,60.00);

INSERT INTO estoque (produto_id,quantidade,estoque_minimo) VALUES
(1,30,5),(2,15,5),(3,80,10),(4,45,8),(5,60,10),
(6,12,3),(7,35,5),(8,18,4),(9,22,5),(10,27,5),
(11,10,3),(12,70,10),(13,40,8),(14,50,10),(15,65,10);

INSERT INTO cupons (codigo,percentual,validade) VALUES
('BEMVINDO10',10,'2026-12-31'),('CLIENTE05',5,'2026-11-30'),
('BLACK15',15,'2026-11-30'),('FRETEGRATIS',8,'2026-12-15'),
('VIP20',20,'2026-12-31'),('TECH10',10,'2026-10-31'),
('CASA12',12,'2026-12-20'),('GAME15',15,'2026-12-20'),
('APP05',5,'2026-12-31'),('PRIME10',10,'2026-12-31'),
('OUTUBRO7',7,'2026-10-31'),('NOVO8',8,'2026-12-01'),
('OFERTA18',18,'2026-12-31'),('FLASH10',10,'2026-12-31'),
('ESPECIAL25',25,'2026-12-31');

INSERT INTO transportadoras (nome,telefone,prazo_dias) VALUES
('Correios','0800000001',7),('Jadlog','0800000002',6),
('Total Express','0800000003',5),('Loggi','0800000004',4),
('Mercado Envios','0800000005',6),('Sequoia','0800000006',7),
('Azul Cargo','0800000007',5),('Braspress','0800000008',8),
('FedEx','0800000009',6),('DHL','0800000010',5),
('TNT','0800000011',7),('GFL','0800000012',6),
('Jamef','0800000013',8),('Direct','0800000014',6),
('Mandae','0800000015',5);

INSERT INTO pedidos (cliente_id,endereco_id,cupom_id,data_pedido,status,frete) VALUES
(1,1,1,'2026-09-01 09:10','ENTREGUE',20),
(2,2,2,'2026-09-02 10:20','ENTREGUE',25),
(3,3,NULL,'2026-09-03 11:30','PAGO',18),
(4,4,3,'2026-09-04 12:40','ENVIADO',30),
(5,5,NULL,'2026-09-05 13:50','ENTREGUE',22),
(6,6,4,'2026-09-06 14:00','PAGO',0),
(7,7,5,'2026-09-07 15:10','SEPARACAO',25),
(8,8,NULL,'2026-09-08 16:20','ENTREGUE',28),
(9,9,6,'2026-09-09 17:30','ENVIADO',20),
(10,10,NULL,'2026-09-10 18:40','PAGO',19),
(11,11,7,'2026-09-11 09:30','ENTREGUE',24),
(12,12,8,'2026-09-12 10:40','ENTREGUE',26),
(13,13,NULL,'2026-09-13 11:50','CANCELADO',20),
(14,14,9,'2026-09-14 12:00','PAGO',21),
(15,15,10,'2026-09-15 13:10','PENDENTE',23);

INSERT INTO itens_pedido (pedido_id,produto_id,quantidade,preco_unitario) VALUES
(1,1,1,1899.90),(2,2,1,3499.90),(3,3,2,89.90),(4,4,1,249.90),
(5,5,2,159.90),(6,6,1,1299.90),(7,7,1,299.90),(8,8,1,899.90),
(9,9,1,2699.90),(10,10,1,1199.90),(11,11,1,2199.90),
(12,12,2,79.90),(13,13,1,399.90),(14,14,1,199.90),(15,15,3,129.90);

INSERT INTO pagamentos (pedido_id,metodo,valor,status,pago_em) VALUES
(1,'PIX',1919.90,'APROVADO','2026-09-01 09:15'),
(2,'CARTAO_CREDITO',3524.90,'APROVADO','2026-09-02 10:25'),
(3,'PIX',197.80,'APROVADO','2026-09-03 11:35'),
(4,'CARTAO_CREDITO',279.90,'APROVADO','2026-09-04 12:45'),
(5,'PIX',341.80,'APROVADO','2026-09-05 13:55'),
(6,'CARTAO_DEBITO',1299.90,'APROVADO','2026-09-06 14:05'),
(7,'PIX',324.90,'APROVADO','2026-09-07 15:15'),
(8,'CARTAO_CREDITO',927.90,'APROVADO','2026-09-08 16:25'),
(9,'PIX',2719.90,'APROVADO','2026-09-09 17:35'),
(10,'BOLETO',1218.90,'APROVADO','2026-09-10 18:45'),
(11,'PIX',2223.90,'APROVADO','2026-09-11 09:35'),
(12,'CARTAO_CREDITO',185.80,'APROVADO','2026-09-12 10:45'),
(13,'PIX',419.90,'ESTORNADO','2026-09-13 11:55'),
(14,'CARTAO_DEBITO',220.90,'APROVADO','2026-09-14 12:05'),
(15,'PIX',412.70,'PENDENTE',NULL);

INSERT INTO entregas (pedido_id,transportadora_id,codigo_rastreio,data_envio,data_entrega,status) VALUES
(1,1,'BR000000001','2026-09-02','2026-09-07','ENTREGUE'),
(2,2,'BR000000002','2026-09-03','2026-09-09','ENTREGUE'),
(3,3,'BR000000003','2026-09-04',NULL,'EM_TRANSITO'),
(4,4,'BR000000004','2026-09-05',NULL,'EM_TRANSITO'),
(5,5,'BR000000005','2026-09-06','2026-09-12','ENTREGUE'),
(6,6,'BR000000006','2026-09-07',NULL,'EM_TRANSITO'),
(7,7,'BR000000007',NULL,NULL,'AGUARDANDO'),
(8,8,'BR000000008','2026-09-09','2026-09-15','ENTREGUE'),
(9,9,'BR000000009','2026-09-10',NULL,'EM_TRANSITO'),
(10,10,'BR000000010','2026-09-11',NULL,'EM_TRANSITO'),
(11,11,'BR000000011','2026-09-12','2026-09-18','ENTREGUE'),
(12,12,'BR000000012','2026-09-13','2026-09-19','ENTREGUE'),
(13,13,'BR000000013',NULL,NULL,'AGUARDANDO'),
(14,14,'BR000000014','2026-09-15',NULL,'EM_TRANSITO'),
(15,15,'BR000000015',NULL,NULL,'AGUARDANDO');

INSERT INTO avaliacoes (cliente_id,produto_id,nota,comentario,data_avaliacao) VALUES
(1,1,5,'Produto excelente e entrega rapida','2026-09-08'),
(2,2,5,'Notebook muito bom','2026-09-10'),
(3,3,4,'Bom custo beneficio','2026-09-10'),
(4,4,5,'Teclado de otima qualidade','2026-09-11'),
(5,5,4,'Som muito bom','2026-09-13'),
(6,6,5,'Funcionou perfeitamente','2026-09-14'),
(7,7,4,'Bom controle','2026-09-15'),
(8,8,5,'Muito confortavel','2026-09-16'),
(9,9,5,'Celular excelente','2026-09-16'),
(10,10,4,'Tela muito boa','2026-09-17'),
(11,11,5,'Camera excelente','2026-09-18'),
(12,12,4,'Suporte pratico','2026-09-19'),
(13,13,5,'Relogio completo','2026-09-20'),
(14,14,4,'Mochila resistente','2026-09-20'),
(15,15,5,'Lampada facil de configurar','2026-09-21');
