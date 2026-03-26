INSERT INTO clientes (nome, cidade) VALUES
('Ana Souza', 'São Paulo'),
('Carlos Lima', 'Rio de Janeiro'),
('Mariana Alves', 'Belo Horizonte'),
('João Pedro', 'Curitiba'),
('Fernanda Costa', 'Porto Alegre'),
('Lucas Martins', 'Recife'),
('Juliana Rocha', 'Salvador'),
('Bruno Silva', 'Fortaleza');

INSERT INTO produtos (nome, categoria, preco) VALUES
('Notebook', 'Eletrônicos', 3500.00),
('Mouse', 'Eletrônicos', 80.00),
('Teclado', 'Eletrônicos', 150.00),
('Monitor', 'Eletrônicos', 900.00),
('Cadeira Gamer', 'Móveis', 1200.00),
('Mesa', 'Móveis', 700.00),
('Headset', 'Eletrônicos', 250.00),
('Webcam', 'Eletrônicos', 200.00);

INSERT INTO pedidos (id_cliente, data_pedido) VALUES
(1, '2025-01-10'),
(2, '2025-01-15'),
(3, '2025-02-01'),
(4, '2025-02-10'),
(5, '2025-03-05'),
(1, '2025-03-15'),
(6, '2025-04-01'),
(7, '2025-04-10'),
(8, '2025-04-15'),
(2, '2025-05-01');

INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1),
(3, 4, 1),
(4, 5, 1),
(5, 6, 1),
(6, 2, 3),
(7, 7, 2),
(8, 8, 1),
(9, 1, 1),
(10, 3, 2);
