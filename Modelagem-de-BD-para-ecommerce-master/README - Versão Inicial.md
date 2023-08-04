# Modelagem conceitual de um banco de dados para aplicação em E-commerce:



## Versão Inicial: Requisitos

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

### Software de modelagem:

MySQL Workbench