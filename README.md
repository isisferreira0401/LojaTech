#🗄️ Banco de Dados Relacional: Consultas SQL, Stored Procedures e Views (loja_tech)

Repositório individual desenvolvido para a disciplina de Banco de Dados, contendo a criação do banco TechStore (loja_tech), resolução dos desafios de consultas SQL, implementação de Stored Procedures e estudo prático comparativo sobre quando utilizar Views ao invés de Stored Procedures.

🎯 Sobre o Projeto

O projeto simula o ambiente de dados de um e-commerce de produtos de tecnologia (TechStore) e contempla:

Estruturação do Banco (loja_tech): Criação das tabelas relacionais com restrições de integridade (PRIMARY KEY, FOREIGN KEY, UNIQUE, ENUM, colunas calculadas GENERATED ALWAYS) e carga inicial de dados.

10 Desafios de Consultas SQL: Filtros simples e compostos, ordenação, buscas textuais com LIKE, funções de agregação (COUNT, SUM) e junções (INNER JOIN).

Stored Procedures: Procedimentos armazenados seguindo boas práticas (DROP PROCEDURE IF EXISTS, DELIMITER //, prefixos p_ para parâmetros e v_ para variáveis locais, parâmetros IN/OUT, validações de regras de negócio e auditoria na tabela log_operacoes).

Pesquisa Aplicada (Views vs. Procedures): Estudo prático com 5 cenários reais demonstrando quando priorizar o uso de VIEW.

📁 Estrutura do Repositório

📦 atividade-stored-procedures-mysql
 ┣ 📜 01_schema_e_dados_iniciais.sql     # DDL e DML do banco loja_tech
 ┣ 📜 02_consultas_sql.sql               # Resolução dos 10 desafios de consultas SQL (Parte 1)
 ┣ 📜 03_stored_procedures.sql           # Stored Procedures da lista (Parte 2) + exercícios da aula
 ┣ 📜 04_views_exemplos.sql              # 5 casos práticos de uso de Views vs. Stored Procedures
 ┗ 📜 README.md                          # Documentação completa do projeto

🗂️ Modelo Entidade-Relacionamento (DER)

erDiagram
    categorias ||--o{ produtos : "possui"
    clientes ||--o{ pedidos : "realiza"
    pedidos ||--|{ itens_pedido : "contém"
    produtos ||--o{ itens_pedido : "está em"

    categorias {
        INT id_categoria PK
        VARCHAR nome
        TEXT descricao
        BOOLEAN ativo
    }
    produtos {
        INT id_produto PK
        INT id_categoria FK
        VARCHAR nome
        DECIMAL preco
        INT estoque
        INT estoque_minimo
        BOOLEAN ativo
    }
    clientes {
        INT id_cliente PK
        VARCHAR nome
        VARCHAR email
        CHAR cpf
        VARCHAR telefone
    }
    pedidos {
        INT id_pedido PK
        INT id_cliente FK
        DATETIME data_pedido
        ENUM status
        DECIMAL valor_total
    }
    itens_pedido {
        INT id_item PK
        INT id_pedido FK
        INT id_produto FK
        INT quantidade
        DECIMAL preco_unitario
        DECIMAL subtotal
    }
    log_operacoes {
        INT id_log PK
        VARCHAR tabela_afetada
        VARCHAR operacao
        TEXT descricao
    }

    


