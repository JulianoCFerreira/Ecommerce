USE Ecommerce;

-- ========================================
-- 1️⃣ Quantos pedidos foram feitos por cada cliente
-- ========================================
SELECT c.id_cliente, c.nome, COUNT(p.id_pedido) AS total_pedidos
FROM Cliente c
LEFT JOIN Pedido p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nome
ORDER BY total_pedidos DESC;

-- ========================================
-- 2️⃣ Algum vendedor também é fornecedor?
-- ========================================
-- Assumindo que "vendedor" seria ClientePJ
SELECT pj.razao_social AS cliente_pj, f.nome AS fornecedor
FROM ClientePJ pj
INNER JOIN Fornecedor f
  ON pj.cnpj = f.cnpj;

-- ========================================
-- 3️⃣ Relação de produtos, fornecedores e estoque
-- ========================================
SELECT pr.nome AS produto, f.nome AS fornecedor, pr.estoque
FROM Produto pr
INNER JOIN ProdutoFornecedor pf ON pr.id_produto = pf.id_produto
INNER JOIN Fornecedor f ON pf.id_fornecedor = f.id_fornecedor
ORDER BY pr.nome;

-- ========================================
-- 4️⃣ Relação de nomes dos fornecedores e produtos
-- ========================================
SELECT f.nome AS fornecedor, GROUP_CONCAT(pr.nome SEPARATOR ', ') AS produtos
FROM Fornecedor f
INNER JOIN ProdutoFornecedor pf ON f.id_fornecedor = pf.id_fornecedor
INNER JOIN Produto pr ON pf.id_produto = pr.id_produto
GROUP BY f.id_fornecedor, f.nome
ORDER BY f.nome;

-- ========================================
-- 5️⃣ Pedidos com valor total (itens + frete)
-- ========================================
SELECT p.id_pedido, c.nome AS cliente,
       SUM(ip.quantidade * ip.preco_unitario) + p.valor_frete AS valor_total
FROM Pedido p
INNER JOIN ItemPedido ip ON p.id_pedido = ip.id_pedido
INNER JOIN Cliente c ON p.id_cliente = c.id_cliente
GROUP BY p.id_pedido, c.nome, p.valor_frete
ORDER BY valor_total DESC;

-- ========================================
-- 6️⃣ Clientes com mais de 1 pedido
-- ========================================
SELECT c.nome, COUNT(p.id_pedido) AS total_pedidos
FROM Cliente c
INNER JOIN Pedido p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nome
HAVING total_pedidos > 1
ORDER BY total_pedidos DESC;

-- ========================================
-- 7️⃣ Pedidos que ainda não foram entregues
-- ========================================
SELECT p.id_pedido, c.nome AS cliente, e.status AS entrega_status
FROM Pedido p
INNER JOIN Cliente c ON p.id_cliente = c.id_cliente
LEFT JOIN Entrega e ON p.id_pedido = e.id_pedido
WHERE e.status IS NULL OR e.status <> 'Entregue'
ORDER BY p.data_pedido DESC;

-- ========================================
-- 8️⃣ Total pago por cada pedido
-- ========================================
SELECT p.id_pedido, c.nome AS cliente, SUM(pg.valor) AS total_pago
FROM Pedido p
INNER JOIN Cliente c ON p.id_cliente = c.id_cliente
INNER JOIN Pagamento pg ON p.id_pedido = pg.id_pedido
GROUP BY p.id_pedido, c.nome
ORDER BY total_pago DESC;

-- ========================================
-- 9️⃣ Produtos sem estoque
-- ========================================
SELECT nome, estoque
FROM Produto
WHERE estoque = 0;

-- ========================================
-- 🔟 Clientes PJ e seus pedidos
-- ========================================
SELECT pj.razao_social AS cliente_pj, p.id_pedido, p.status
FROM ClientePJ pj
LEFT JOIN Pedido p ON pj.id_cliente = p.id_cliente
ORDER BY pj.razao_social, p.id_pedido;
