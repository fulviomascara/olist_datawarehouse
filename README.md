## Projeto Olist Data Warehouse

Projeto para construção de uma plataforma moderna de dados, baseada em uma arquitetura de Data Warehouse, cujo foco será o de fornecer uma estrutura para construção de produtos de dados para uma fictícia (não tão fictícia assim) empresa de e-commerce.

A evolução do projeto se dará através de artigos no Medium, cada um trabalhando competências específicas de uma platforma moderna de dados, conforme abaixo:

- Ingerir os dados de origem de um banco de dados transacional e armazenar os mesmos em um data warehouse
- Orquestrar as tarefas de ingestão já desenvolvidas e encadear as mesmas com tarefas de data quality para validar os dados brutos (raw) armazenados no data warehouse
- Transformar os dados brutos em OBTs (One Big Table ou "Tabelões de Ramos"), criando visões granulares (trusted) e agregadas (refined) para análise, armazenando também no data warehouse
- Disponibilizar os metadados das OBTs em um catálogo de dados que possa ser consultado pelos usuários
- Criar charts e dashboards para análise, consumindo os dados diretamente do data warehouse

# A Stack da Plataforma Moderna de Dados para este Projeto segue no diagrama abaixo

# Uma explicação sobre o caso de uso

No meu dia a dia lido com diversos contextos de negócio na plataforma de dados que estamos trabalhando, mas um dos contextos que nutro mais interesse é o de vendas, cujos dados vêm predominantemente de um CRM. Pensei que trazer dados de um CRM seria interessante para explorar bem este contexto, mas tive dificuldade em encontrar algo "usável" e parti para busca de algo análogo, onde tivéssemos como trabalhar entidades como cliente, produto e pedido.

Na pesquisa que eu fiz, encontrei um super dataset no Kaggle chamado Brazilian E-Commerce Public Dataset by Olist, criado pelo André Sionek, que contém dados do marketplace Olist e traz as entidades que eu descrevi acima, além de dados de geolocalização, pagamentos e reviews. Os dados são de pedidos reais (aproximadamente 100k) realizados entre 2016 e 2018, mas com informações anonimizadas usando as casas de Game of Thrones.

O super dataset da Olist é formado por 9 arquivos CSV, sendo um arquivo para cada uma das bases apresentadas no diagrama acima, além de 1 arquivo contendo um "De/Para" traduzindo as categorias de produtos do idioma português pro idioma inglês. Como pode ser percebido, temos nesta base informações com característica mais cadastral como produtos, vendedores, clientes e cadastro de CEPs (Zip Codes), bem como informações de natureza transacional como pedidos (e seus itens), pagamentos e avaliações (reviews).

Esta base de dados abre possibilidades de criação de produtos de dados para alguns temas como: previsão de vendas, análise de prazo de entrega, análise de vendas por geolocalização, análise de sentimentos, dentre outros.
