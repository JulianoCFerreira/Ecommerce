# 🛒 Projeto Lógico de Banco de Dados - E-commerce

Este repositório contém o **projeto lógico de banco de dados** para um sistema de E-commerce, modelado em MySQL.

O objetivo é representar as entidades, relacionamentos e regras de negócio de um e-commerce, permitindo consultas analíticas e operacionais.

---

## 📊 Contexto do Projeto
O esquema lógico foi projetado para atender operações comuns de um e-commerce, incluindo:

- **Clientes** podem ser **Pessoa Física (PF)** ou **Pessoa Jurídica (PJ)**  
  - Uma conta **não** pode ter as duas informações simultaneamente.
- **Pedidos** com múltiplos itens e **múltiplas formas de pagamento**.
- **Entrega** com status e **código de rastreio**.
- Produtos podem ter **diversos fornecedores** e pertencer a **categorias**.

---

## 🗂️ Estrutura do Repositório
| Arquivo | Descrição |
|---------|-----------|
| [`schema.sql`](sql/schema.sql) | Script de criação do banco de dados e tabelas (DDL). |
| [`data.sql`](sql/data.sql) | Inserts de dados de teste. |
| [`queries.sql`](sql/queries.sql) | Consultas SQL para validação e análise. |
| [`docs/er_diagram.png`](docs/er_diagram.png) | Diagrama EER (opcional). |

---

## 🏛️ Modelo Lógico Resumido
Principais entidades e relacionamentos:

- **Cliente**(`id_cliente` PK, nome, email UNIQUE, telefone, data_cadastro)  
- **ClientePF**(`id_cliente` PK/FK → Cliente, cpf UNIQUE)  
- **ClientePJ**(`id_cliente` PK/FK → Cliente, cnpj UNIQUE, razao_social)  
- **Endereco**(`id_endereco` PK, id_cliente FK, logradouro, numero, cidade, estado, cep, tipo_endereco)  
- **Fornecedor**(`id_fornecedor` PK, nome, cnpj UNIQUE)  
- **Categoria**(`id_categoria` PK, nome UNIQUE)  
- **Produto**(`id_produto` PK, nome, descricao, preco, estoque, id_categoria FK)  
- **ProdutoFornecedor**(`id_fornecedor` FK, id_produto` FK, PK(id_fornecedor, id_produto))  
- **Pedido**(`id_pedido` PK, id_cliente FK, data_pedido, status, valor_frete)  
- **ItemPedido**(`id_item` PK, id_pedido FK, id_produto FK, quantidade, preco_unitario)  
- **Pagamento**(`id_pagamento` PK, id_pedido FK, tipo, valor, data_pagamento) — 1:N  
- **Entrega**(`id_entrega` PK, id_pedido FK, codigo_rastreio UNIQUE, status)

---

## 🔧 Como Executar
1. **Clone** este repositório ou faça download do `.zip`.
2. Em seu cliente MySQL (Workbench, DBeaver ou CLI):
   ```sql
   SOURCE sql/schema.sql;
   SOURCE sql/data.sql;
