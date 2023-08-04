# Projeto de banco de dados para cenário de E-commerce:

**Contexto de aplicação:** Base de dados para gerenciar informações de um ambiente de Comércio Eletrônico.

**Tipo de banco de dados**: Relacional.

**SGBD**: MySQL

**Desenvolvedor**: Danilo Cesar ADS

**Objetivo**: Criar um projeto lógico de sistema de banco de dados relacional para persistir e gerenciar informações relativas as atividades comerciais e logísticas de uma empresa de E-commerce.

## Etapas do projeto lógico de banco de dados relacional:

* Levantamento de requisitos;
* Modelagem do BD;
* Construção do BD - Criação do BD conforme estimado em modelagem, bem como a realização de testes unitários em busca de correção de erros;
* Persistência de dados para teste de funcionamento do BD;
* Criação de consultas para obtenção de informações persistidas e cálculos relativos a aplicação de E-commerce.



## Levantamento de requisitos

- Produto:
  - Os produtos, comercializados no marketplace, podem ter vendedores terceirizados, que divulgam o produto por meio da utilização do espaço fornecido pela plataforma de E-commerce;
  - Cada produto possui um fornecedor;
  - Um ou vários produtos podem compor um pedido.

- Cliente:
  - O cadastro pode ser realizado com CPF ou CNPJ;
  - O endereço do cliente é referência para calcular o valor do frete;
  - Um cliente pode fazer vários pedidos. Cada pedido terá sua carência para processo de devolução do mesmo.
- Pedido:
  - O pedido é gerado pelo cliente e possui informações de compra, endereço e status de entrega;
  - Mais de um produto pode compor o pedido;
  - O pedido pode ser cancelado.

## Propostas de refinamento do modelo:

- Uma conta de cliente não pode ter CPF e CNPJ ao mesmo tempo, ou seja, é só PF ou PJ;
- Cadastrar mais de uma forma de pagamento para o mesmo cliente;
- A entrega deve persistir o status e o código de rastreio do pedido.

## Sugestão para a modelagem:

* Na tentativa de solucionar essa restrição de cadastro para que o cliente não tenha CPF e CNPJ simultaneamente, foram criadas duas entidades diferentes (CPF, CNPJ) à partir de uma comum (Cliente) e terceirizar a decisão de exclusividade para a aplicação que fará o acesso ao banco de dados;

## Construção do BD:

A construção do BD, foi dividida em 3 scripts diferentes para organização. São eles:

* Criação Ecommerce.sql >> Script com as instruções para criar o banco de dados;
* Persistência Ecommerce.sql >> Script com as instruções para gravar os dados no BD;
* Consultas Ecommerce.sql >> Script com as Queries de consulta.

## Relação de algumas perguntas respondidas e solicitações retornadas através do uso das Queries no Banco de Dados:

* Recuperações de tabelas completas com SELECT...
* Quero ver o id, a cidade e o estado referente aos clientes...
* Quero ver o Nome Fantasia e o CNPJ dos cliente PJ...
* Consulta de campos específicos de duas tabelas...
* Recuperando o cadastro de clientes PJ de duas maneiras, por filtro WHERE e por JOIN...
* Retorno de dados de clientes PJ ordenados pela data de fundação da empresa...
* Quantos pedidos foram feitos por cada cliente?
* Algum vendedor também é fornecedor?
* Quero uma relação de produtos, fornecedores e saldos de estoques interno e externo para fornecimento!
* Quero uma relação de nomes dos fornecedores, nomes dos produtos e seus respectivos preços de venda na loja virtual!
* Qual o valor total do estoque interno em função do preço de venda?
* Qual o valor total do estoque interno em função do preço de venda, dividido por cada produto e ordenado pelo valor de estoque mais alto?
* Aproveitando a Query anterior, como implementar uma meta de vendas em função do valor total do estoque(25%, 50%, 75%,...)???
* Qual é o valor médio geral dos produtos em todo o site?
* O cliente é pessoa física ou jurídica?
*  Quero visualizar produtos com estoque baixo!
* Qual o valor total de cada pedido realizado no site?
* Qual o valor do ticket médio por cliente em todo o site?
* Qual o total de cada produto vendido no site? Como podemos ranqueá-los no retorno da consulta?
* Aproveitando a Query anterior, como visualizar o contexto de REALIZADO VS META no site?

### Software de modelagem:

MySQL Workbench