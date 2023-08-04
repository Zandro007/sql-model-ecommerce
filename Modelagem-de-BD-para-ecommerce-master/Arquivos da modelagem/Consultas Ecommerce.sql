-- Script com as consultas realizadas no banco de dados:
-- Developed by Danilo Cesar ADS

-- Selecionando a base de dados a ser utilizada...
use ecommerce;

-- DONE - Recuperações de tabelas completas com SELECT:
select * from Clients;
select * from NaturalPerson;
select * from LegalPerson;
select * from product;
select * from productStorage;

-- DONE - Recuperações de campos específicos com SELECT:
-- DONE - Quero ver o id, a cidade e o estado referente aos clientes...
select idClient, City, State from Clients;
-- DONE - Quero ver o Nome Fantasia e o CNPJ dos cliente PJ...
select Fname, CNPJ from LegalPerson;

-- Filtros com WHERE:
-- DONE - Consulta de campos específicos de duas tabelas...
select O.idOrders, O.ordersStatus, c.idClient from orders O, Clients c where O.idOrdersClient = c.idClient;

-- DONE - Recuperando o cadastro de clientes PJ de duas maneiras, por filtro WHERE e por JOIN...
select * from LegalPerson l inner join Clients on l.idLPclient = Clients.idClient;
select * from LegalPerson l, Clients where l.idLPclient = Clients.idClient;
 
-- DONE - Ordenações de dados com ORDER BY:
-- Retorno de dados de clientes PJ ordenados pela data de fundação da empresa...
select Fname, CNPJ,Foundation from LegalPerson order by Foundation;

-- DONE - Quantos pedidos foram feitos por cada cliente?
select c.idClient, concat(np.Fname,' ',np.Lname) as Complete_Name, count(*) as QtyOfOrders from Clients as c
	inner join orders as O on c.idClient = O.idOrdersClient
    inner join NaturalPerson as np on c.idClient = np.idNPerson
    group by idClient;
    
-- DONE - Algum vendedor também é fornecedor?
select sl.Sname, sl.Fname, sl.CPF_CNPJ, sp.Sname, sp.Fname, sp.CNPJ from seller sl, supplier sp
	where sl.CPF_CNPJ = SP.CNPJ;
    
-- DONE - Quero uma relação de produtos, fornecedores e saldos de estoques interno e externo para fornecimento!
select idProduct, Pname as Product, sp.Sname as Supplier, sp.CNPJ, ps.Quantity as Supplier_Storage_Qty, 
sl.Quantity as Internal_Storage_Qty, s.storageLocation as Internal_Storage from product 
	inner join productSupplier ps on idProduct = idPSproduct
    inner join supplier sp on idSupplier = idPSsupplier
    inner join storageLocation sl on idLproduct = idProduct
    inner join productStorage s on idLstorage = idProdStorage;
    
-- DONE - Quero uma relação de nomes dos fornecedores, nomes dos produtos e seus respectivos preços de venda na loja virtual!
select sp.Sname as Supplier, p.Pname as Product, p.Price as Unit_Sell_Price from supplier sp inner join productSupplier ps on idSupplier = idPSsupplier
	inner join product p on idProduct = idPSproduct
    order by sp.Sname, p.Pname;

-- DONE - Qual o valor total do estoque interno em função do preço de venda?
select sum(p.Price * sl.Quantity) as Total_Storage_value from storageLocation sl 
	inner join product p on idProduct = idLproduct;

-- DONE - Qual o valor total do estoque interno em função do preço de venda, dividido por cada produto 
-- e ordenado pelo valor de estoque mais alto?
select p.idProduct as Product_Code, p.Pname as Product, p.Price as Price, sl.Quantity as Internal_Storage_Qty, 
sum(p.Price * sl.Quantity) as Total_Storage_value from storageLocation sl 
	inner join product p on idProduct = idLproduct
    group by p.idProduct
    order by Total_Storage_value desc;
    
-- DONE - Aproveitando a Query anterior, como implementar uma meta de vendas em função do valor
-- total do estoque(25%, 50%, 75%,...)???
select p.idProduct as Product_Code, p.Pname as Product, p.Price as Price, sl.Quantity as Internal_Storage_Qty, 
sum(p.Price * sl.Quantity) as Total_Storage_value, 
((sum(p.Price * sl.Quantity)) * 0.75) as Sell_Objective_75,
((sum(p.Price * sl.Quantity)) * 0.5) as Sell_Objective_50,
((sum(p.Price * sl.Quantity)) * 0.25) as Sell_Objective_25 from storageLocation sl 
	inner join product p on idProduct = idLproduct
    group by p.idProduct
    order by Total_Storage_value desc;
    
-- DONE - Qual é o valor médio geral dos produtos em todo o site?
select avg(Price) from product;

-- DONE - O cliente é pessoa física ou jurídica?
select np.idNPClient, lp.idLPClient, np.Fname, lp.Sname, np.CPF, lp.CNPJ from NaturalPerson np
left outer join LegalPerson lp on np.idNPClient = lp.idLPClient
union
select np.idNPClient, lp.idLPClient, np.Fname, lp.Sname, np.CPF, lp.CNPJ from NaturalPerson np
right outer join LegalPerson lp on np.idNPClient = lp.idLPClient;

-- DONE - Quero visualizar produtos com estoque baixo!    
select idProduct, Pname, Price, ps.idProdStorage, ps.storageLocation, sl.Quantity from product p
	inner join storageLocation sl on p.idProduct = sl.idLProduct
    inner join productStorage ps on sl.idLstorage = ps.idProdStorage
    having sl.Quantity <= 5;
    
-- DONE - Qual o valor total de cada pedido realizado no site?
select o.idOrders, sum(po.poQuantity * p.Price) as Total_Pedido from orders o
	inner join productOrder po on o.idOrders = po.idPOorder
	inner join product p on po.idPOproduct = p.idProduct
	group by o.idOrders;

-- DONE - Qual o valor do ticket médio por cliente em todo o site?
select avg(Total_Pedido) as Ticket_Médio_Site from(select sum(po.poQuantity * p.Price) as Total_Pedido from orders o
	inner join productOrder po on o.idOrders = po.idPOorder
	inner join product p on po.idPOproduct = p.idProduct
	group by o.idOrders) orders;

-- DONE - Qual o total de cada produto vendido no site? Como podemos ranqueá-los no retorno da consulta?
select p.idProduct, p.Pname, sum(po.poQuantity) as Total_de_produtos_vendidos from productOrder po
inner join product p on po.idPOproduct = p.idProduct
inner join orders o on po.idPOorder = o.idOrders
group by p.idProduct
order by Total_de_produtos_vendidos desc;

-- DONE - Aproveitando a Query anterior, como visualizar o contexto de REALIZADO VS META no site?
select p.idProduct, p.Pname, sum(po.poQuantity) as Total_de_produtos_vendidos,
sum(po.poQuantity * p.Price) as Total_Vendas,
((p.Price * sl.Quantity) * 0.75) as Sell_Objective_75,
((sum(po.poQuantity * p.Price) / ((p.Price * sl.Quantity) * 0.75)) * 100) as Realizado_VS_Meta from productOrder po
inner join product p on po.idPOproduct = p.idProduct
inner join orders o on po.idPOorder = o.idOrders
inner join storageLocation sl on p.idProduct = sl.idLproduct
group by p.idProduct
order by Total_de_produtos_vendidos desc;
