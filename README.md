# Ecommerce
Projeto lógico de banco de dados de e-commerce com MySQL.


Este repositório contém o **projeto lógico de banco de dados** desenvolvido como parte de um desafio de modelagem e implementação em SQL para um cenário de **e-commerce**.  
O objetivo é apresentar a modelagem refinada, o esquema lógico e as queries SQL para atender requisitos de negócio com **integridade referencial** e **normalização**.

---

## 📚 Contexto do Projeto

A aplicação simula um **sistema de vendas online**, permitindo:
- Cadastro de **clientes** (Pessoa Física ou Pessoa Jurídica)
- Registro de **fornecedores** e seus produtos
- Criação de **pedidos** com múltiplos itens
- Controle de **estoque** e **entregas**
- Registro de **pagamentos múltiplos** por pedido

O modelo foi construído a partir de um **Modelo Entidade-Relacionamento Estendido (EER)**, posteriormente mapeado para o modelo relacional com aplicação de **refinamentos**.

---

## 🔑 Requisitos Atendidos

| Requisito | Implementação |
|-----------|----------------|
| **Cliente PF ou PJ** | Especialização exclusiva (XOR) com tabelas `ClientePF` e `ClientePJ` |
| **Pagamento Múltiplo** | Um pedido pode ter várias formas de pagamento (1:N) |
| **Entrega** | Cada pedido pode ter uma ou mais entregas, com status e código de rastreio |
| **Fornecedor/Produto** | Relacionamento N:N (`ProdutoFornecedor`) para indicar quem fornece cada produto |
| **Integridade** | Chaves primárias, estrangeiras, UNIQUE e CHECK constraints para manter consistência |

---

## 🗂️ Estrutura do Banco

### Principais Tabelas
- **Cliente**: Dados comuns de clientes PF e PJ.
- **ClientePF** / **ClientePJ**: Especialização exclusiva para pessoas físicas ou jurídicas.
- **Fornecedor**: Empresas fornecedoras de produtos.
- **Produto**: Itens comercializados, com estoque e categoria.
- **ProdutoFornecedor**: Relação N:N entre fornecedores e produtos.
- **Pedido**: Registro dos pedidos realizados pelos clientes.
- **ItemPedido**: Itens e quantidades dentro de cada pedido.
- **Pagamento**: Formas de pagamento (1:N com Pedido).
- **Entrega**: Informações de envio, status e código de rastreio.
- **Categoria**: Classificação dos produtos.

---

## 🏗️ Modelo Lógico (Resumo)

