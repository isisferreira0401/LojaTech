# 🗄️ Banco de Dados Relacional: Consultas SQL, Stored Procedures e Views (loja_tech)

Repositório individual desenvolvido para a disciplina de Banco de Dados, contendo a criação do banco TechStore (loja_tech), resolução dos desafios de consultas SQL, implementação de Stored Procedures e estudo prático comparativo sobre quando utilizar Views ao invés de Stored Procedures.

# 🎯 Sobre o Projeto

O projeto simula o ambiente de dados de um e-commerce de produtos de tecnologia (TechStore) e contempla:

Estruturação do Banco (loja_tech): Criação das tabelas relacionais com restrições de integridade (PRIMARY KEY, FOREIGN KEY, UNIQUE, ENUM, colunas calculadas GENERATED ALWAYS) e carga inicial de dados.

10 Desafios de Consultas SQL: Filtros simples e compostos, ordenação, buscas textuais com LIKE, funções de agregação (COUNT, SUM) e junções (INNER JOIN).

Stored Procedures: Procedimentos armazenados seguindo boas práticas (DROP PROCEDURE IF EXISTS, DELIMITER //, prefixos p_ para parâmetros e v_ para variáveis locais, parâmetros IN/OUT, validações de regras de negócio e auditoria na tabela log_operacoes).

Pesquisa Aplicada (Views vs. Procedures): Estudo prático com 5 cenários reais demonstrando quando priorizar o uso de VIEW.

# 📁 Estrutura do Repositório

📦 atividade-stored-procedures-mysql
 
 ┣ 📜 01_schema_e_dados_iniciais.sql     # DDL e DML do banco loja_tech

 ┣ 📜 02_consultas_sql.sql               # Resolução dos 10 desafios de consultas SQL (Parte 1)

 ┣ 📜 03_stored_procedures.sql           # Stored Procedures da lista (Parte 2) + exercícios da aula

 ┣ 📜 04_views_exemplos.sql              # 5 casos práticos de uso de Views vs. Stored Procedures

 ┗ 📜 README.md                          # Documentação completa do projeto

# 🗂️ Modelo Entidade-Relacionamento (DER)

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

# 🚀 Como Executar no MySQL Workbench

Execute os scripts exatamente na ordem numérica abaixo para garantir a integridade dos dados:

1- 01_schema_e_dados_iniciais.sql: Cria o banco loja_tech, as tabelas e insere a carga inicial de dados.

2- 02_consultas_sql.sql: Executa os 10 relatórios da Parte 1 sobre os dados originais.

3- 03_stored_procedures.sql: Cria e testa as Stored Procedures utilizando CALL e variáveis de sessão (@).

4- 04_views_exemplos.sql: Cria e consulta as 5 Views desenvolvidas na pesquisa.

# ⚙️ Resumo das Stored Procedures Implementadas

Procedure

Parâmetros

Descrição

listar_categorias_ativas

Nenhum

Lista todas as categorias com ativo = TRUE em ordem alfabética.

buscar_pedidos_por_status

IN p_status

Filtra pedidos de acordo com o status informado (ex: 'pendente').

inserir_categoria

IN p_nome, IN p_descricao

Insere uma nova categoria na tabela categorias.

atualizar_telefone_cliente

IN p_id_cliente, IN p_telefone

Atualiza o telefone de contato de um cliente específico.

contar_produtos_categoria

IN p_id_categoria, OUT p_total

Retorna a quantidade total de produtos cadastrados em uma categoria.

atualizar_preco_categoria

IN p_id_categoria, IN p_percentual, OUT p_qtd_alterados, OUT p_mensagem

Reajusta preços de produtos ativos (entre -50% e +100%) e grava auditoria em log_operacoes.

consultar_extrato_cliente

IN p_id_cliente

Retorna 3 Result Sets: dados do cliente, histórico de pedidos e resumo financeiro.

# ⚖️ Pesquisa: 5 Situações para Usar VIEW ao Invés de STORED PROCEDURE

Embora ambos sejam objetos armazenados no banco de dados que promovem reuso e segurança, suas finalidades arquiteturais são distintas:

Critério

Stored Procedure

View

Forma de Execução

CALL nome_procedure()

SELECT * FROM nome_view

Manipulação de Dados (DML)

Suporta INSERT, UPDATE, DELETE

Focada em leitura (SELECT)

Controle de Fluxo

Possui IF, CASE, WHILE, TRANSACTION

Consulta puramente declarativa

Composabilidade SQL

Não permite WHERE ou JOIN externo na chamada

Permite WHERE, JOIN, GROUP BY livremente

# Os 5 Cenários Práticos Implementados (04_views_exemplos.sql):

Integração Nativa com Ferramentas de BI (vw_bi_vendas_detalhadas): Softwares como Power BI, Metabase e Tableau conectam-se a Views como se fossem tabelas nativas, permitindo filtros dinâmicos diretamente nos painéis visuais.

Segurança e Privacidade / LGPD (vw_clientes_marketing): Expõe apenas colunas não sensíveis (ocultando cpf e data_nascimento) para equipes de Marketing ou Atendimento sem exigir que o usuário saiba executar comandos procedurais.

Composabilidade em Consultas Ad-Hoc (vw_valor_estoque_produtos): Permite aplicar GROUP BY, ORDER BY e INNER JOIN diretamente sobre o resultado da View, algo inviável com o retorno de um CALL.

Camada de Compatibilidade para Sistemas Legados (vw_pedidos_sistema_legado): Mantém os nomes antigos de colunas e estruturas após refatorações no banco de dados, evitando que aplicações legadas que executam SELECT quebrem.

Monitoramento Contínuo Declarativo (vw_alerta_estoque_critico): Ideal para consultas fixas de acompanhamento (como alertas de estoque mínimo) que não exigem parâmetros de entrada nem alterações de estado no banco.

    


