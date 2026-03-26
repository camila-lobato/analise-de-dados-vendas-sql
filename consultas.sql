-- Faturamento total da empresa
SELECT 
    SUM(p.preco * i.quantidade) AS faturamento_total
FROM itens_pedido i
JOIN produtos p ON i.id_produto = p.id_produto;


-- Produtos mais vendidos
SELECT 
    p.nome,
    SUM(i.quantidade) AS total_vendido
FROM itens_pedido i
JOIN produtos p ON i.id_produto = p.id_produto
GROUP BY p.nome
ORDER BY total_vendido DESC;


-- Clientes que mais gastaram
SELECT 
    c.nome,
    SUM(p.preco * i.quantidade) AS total_gasto
FROM clientes c
JOIN pedidos pe ON c.id_cliente = pe.id_cliente
JOIN itens_pedido i ON pe.id_pedido = i.id_pedido
JOIN produtos p ON i.id_produto = p.id_produto
GROUP BY c.nome
ORDER BY total_gasto DESC;


-- Faturamento por mês
SELECT 
    MONTH(pe.data_pedido) AS mes,
    SUM(p.preco * i.quantidade) AS faturamento
FROM pedidos pe
JOIN itens_pedido i ON pe.id_pedido = i.id_pedido
JOIN produtos p ON i.id_produto = p.id_produto
GROUP BY mes
ORDER BY mes;


-- Subconsulta: clientes que gastaram acima da média
SELECT nome, total_gasto
FROM (
    SELECT 
        c.nome,
        SUM(p.preco * i.quantidade) AS total_gasto
    FROM clientes c
    JOIN pedidos pe ON c.id_cliente = pe.id_cliente
    JOIN itens_pedido i ON pe.id_pedido = i.id_pedido
    JOIN produtos p ON i.id_produto = p.id_produto
    GROUP BY c.nome
) AS dados
WHERE total_gasto > (
    SELECT AVG(total_cliente)
    FROM (
        SELECT SUM(p.preco * i.quantidade) AS total_cliente
        FROM pedidos pe
        JOIN itens_pedido i ON pe.id_pedido = i.id_pedido
        JOIN produtos p ON i.id_produto = p.id_produto
        GROUP BY pe.id_cliente
    ) AS media
);


-- Criação de índice para otimização
CREATE INDEX idx_cliente ON pedidos(id_cliente);
