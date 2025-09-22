USE Ecommerce;

-- ========================================
-- POPULANDO CATEGORIAS
-- ========================================
INSERT INTO Categoria (nome) VALUES
  ('Eletrônicos'),
  ('Vestuário'),
  ('Livros');

-- ========================================
-- POPULANDO FORNECEDORES
-- ========================================
INSERT INTO Fornecedor (nome, cnpj) VALUES
  ('Tech Supplier', '11222333000111'),
  ('Moda Brasil', '22333444000122'),
  ('Editora Alpha', '33444555000133');

-- ========================================
-- POPULANDO PRODUTOS
-- ========================================
INSERT INTO Produto (nome, descricao, preco, estoque, id_categoria) VALUES
  ('Smartphone X', 'Celular topo de linha', 2500.00, 50, 1),
  ('Notebook Pro', 'Notebook para trabalho', 4800.00, 20, 1),
  ('Camiseta Preta', 'Camiseta 100% algodão', 59.90, 200, 2),
  ('Livro SQL Avançado', 'Aprenda SQL com exemplos', 89.90, 100, 3);

-- Associação Produto x Fornecedor (N:N)
INSERT INTO ProdutoFornecedor (id_fornecedor, id_produto) VALUES
  (1, 1),  -- Tech Supplier fornece Smartphone X
  (1, 2),  -- Tech Supplier fornece Notebook Pro
  (2, 3),  -- Moda Brasil fornece Camiseta Preta
  (3, 4);  -- Editora Alpha fornece Livro SQL Avançado

-- ========================================
-- POPULANDO CLIENTES
-- ========================================
INSERT INTO Cliente (nome, email, telefone) VALUES
  ('João Silva', 'joao@example.com', '41999990000'),  -- 1
  ('Maria Souza', 'maria@example.com', '41988887777'), -- 2
  ('Empresa XPTO', 'contato@xpto.com', '41977776666'); -- 3

-- Pessoa Física
INSERT INTO ClientePF (id_cliente, cpf) VALUES
  (1, '11122233344'),
  (2, '22233344455');

-- Pessoa Jurídica
INSERT INTO ClientePJ (id_cliente, cnpj, razao_social) VALUES
  (3, '12345678000199', 'XPTO Comércio de Eletrônicos');

-- Endereços
INSERT INTO Endereco (id_cliente, logradouro, numero, cidade, estado, cep, tipo_endereco) VALUES
  (1, 'Rua das Flores', '123', 'Curitiba', 'PR', '80000000', 'Entrega'),
  (2, 'Av. Brasil', '456', 'São Paulo', 'SP', '01000000', 'Entrega'),
  (3, 'Rua Industrial', '789', 'Curitiba', 'PR', '80010000', 'Cobranca');

-- ========================================
-- POPULANDO PEDIDOS
-- ========================================
-- Pedido 1: João compra Smartphone e Camiseta
INSERT INTO Pedido (id_cliente, status, valor_frete) VALUES
  (1, 'Processando', 20.00);

-- Pedido 2: Maria compra Livro SQL
INSERT INTO Pedido (id_cliente, status, valor_frete) VALUES
  (2, 'Enviado', 15.00);

-- Pedido 3: XPTO compra Notebook
INSERT INTO Pedido (id_cliente, status, valor_frete) VALUES
  (3, 'Pendente', 30.00);

-- Itens dos pedidos
INSERT INTO ItemPedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
  (1, 1, 1, 2500.00), -- Smartphone X
  (1, 3, 2, 59.90),   -- Camiseta Preta
  (2, 4, 1, 89.90),   -- Livro SQL
  (3, 2, 1, 4800.00); -- Notebook Pro

-- Pagamentos (exemplo com múltiplos por pedido)
INSERT INTO Pagamento (id_pedido, tipo, valor) VALUES
  (1, 'CartaoCredito', 1300.00),
  (1, 'Pix', 1260.00),      -- complementa o valor do pedido 1
  (2, 'Boleto', 104.90),
  (3, 'Transferencia', 4830.00);

-- Entregas
INSERT INTO Entrega (id_pedido, codigo_rastreio, status) VALUES
  (1, 'BR123456789', 'EmTransito'),
  (2, 'BR987654321', 'Entregue');
