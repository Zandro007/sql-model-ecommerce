-- Script de criação da Databse para o cenário de aplicação de um fictício Ecommerce:
-- Developed by Danilo Cesar ADS

-- Ordem de criação das entidades individuais, visando evitar erros relativos as chaves e referências de dados:
-- 1) Criar Tabela "Clients";
-- 2) Criar Tabela "NaturalPerson";
-- 3) Criar Tabela "LegalPerson";
-- 4) Criar Tabela "product";
-- 5) Criar Tabela "creditcard";
-- 6) Criar Tabela "payments";
-- 7) Criar Tabela "productStorage";
-- 8) Criar Tabela "supplier";
-- 9) Criar Tabela "seller";
-- 10) Criar Tabela "Carrier";
-- 11) Criar Tabela "Delivery";
-- 12) Criar Tabela "orders";

-- Ordem de criação das tabelas de cardinalidade N para N:
-- 1) Criar Tabela "productSeller";
-- 2) Criar Tabela "productOrder";
-- 3) Criar Tabela "storageLocation";
-- 4) Criar Tabela "productSupplier";

-- ***************************************************************************************
-- INÍCIO DA CRIAÇÃO À PARTIR DAQUI:

-- Criação do Banco de dados para aplicação de E-commerce:

-- Criando a Base de Dados:
create database ecommerce;
-- OBS: DANGEROUS >> Para apagar TODA a base de dados -> drop database ecommerce;

-- Para usar a database e poder criar as tabelas e consultas dentro dela...
use ecommerce;

-- CRIAÇÃO DE TABELAS...

-- ***********************************************************************************************************
-- create table "table"(
	-- Primary Key...
    -- Foreign Key...
	-- Atribbutes...
	-- Constraints...
-- );
-- Visualize table structure...
-- ***********************************************************************************************************

-- Criar a tabela "Clients" (Clientes)...
create table Clients(
	-- Primary Key...
	idClient int auto_increment primary key,
    
    -- Atribbutes...
    Email varchar(45),
    Phone varchar(12),
    Patio varchar(3),
    Address varchar(60),
    AddressNumber int,
    Complement varchar(10),
    Neighborhood varchar(45),
    City varchar(45),
    State varchar(2),
    CEP char(8)
);

-- Visualize table structure...
desc Clients;

-- ***********************************************************************************************************

-- Criar tabela "NaturalPerson"(Pessoa Física)...
create table NaturalPerson(
	-- Primary Key...
	idNPerson int auto_increment primary key,
    
    -- Foreign Key...
    idNPClient int,
    
    -- Atribbutes...
    Fname varchar(20) not null,
    Lname varchar(20),
    CPF varchar(11),
    Birthday date not null,
    
    -- Constraints...
    constraint unique_cpf_client unique (CPF),
    constraint fk_NaturalPerson_Client foreign key (idNPClient) references Clients(idClient)
);

-- Visualize table structure...
desc NaturalPerson;

-- ***********************************************************************************************************

-- Criar tabela "LegalPerson"(Pessoa Jurídica)...
create table LegalPerson(
	-- Primary Key...
	idLPerson int auto_increment primary key,
    
    -- Foreign Key...
    idLPClient int,
    
    -- Atribbutes...
    Sname varchar(45) not null,
    Fname varchar(45),
    CNPJ varchar(14),
    Foundation date not null,
    
    -- Constraints...
    constraint unique_cnpj_client unique (CNPJ),
    constraint fk_LegalPerson_Client foreign key (idLPClient) references Clients(idClient)
);

-- Visualize table structure...
desc LegalPerson;

-- ***********************************************************************************************************

-- Criar tabela "product"(Produto)...
create table product(
	-- Primary Key...
	idProduct int auto_increment primary key,
    
    -- Atribbutes...
    Pname varchar(50) not null,
    PDescription varchar(400),
    Category enum('Eletronicos','Eletroportateis','Brinquedos','Alimentos') not null,
    Price float not null,
    Ratio float default 0,
    Warranty bool,
    Length int,
    Width int,
    Height int
);

-- Visualize table structure...
desc product;

-- ***********************************************************************************************************

-- criar tabela "creditcard"(cartão de crédito)...
create table creditcard(
	-- Primary Key...
	idCreditcard int auto_increment primary key,
    
    -- Atribbutes...
    OwnerName varchar(45),
    CardNumber varchar(16),
    Flag varchar(45),
    ExpDate date
);

-- Visualize table structure...
desc creditcard;

-- ***********************************************************************************************************

-- Criar tabela "payments"(pagamentos)...
create table payments(
	-- Primary Key...
    idPayment int auto_increment primary key,
    
    -- Foreign Key...
    idPayClient int,
    idPcreditcard int,
    
    -- Atribbutes...
    typePayment enum('Boleto','Cartão','PIX'),
    boleto varchar(50),
    pix varchar(20),
    
    -- Constraints...
    constraint fk_client_payment foreign key (idPayClient) references Clients(idClient),
    constraint fk_creditcard_payment foreign key (idPcreditcard) references creditcard(idCreditcard)
);

-- Visualize table structure...
desc payments;

-- ***********************************************************************************************************

-- Criar tabela "orders"(Pedido)...
create table orders(
	-- Primary Key...
	idOrders int auto_increment primary key,
    
    -- Foreign Key...
    idOrdersClient int,
    idOrdersPayment int,
    idOrdersDelivery int,
    
    -- Atribbutes...
    ordersStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
    
    -- Constraints...
    constraint fk_orders_client foreign key (idOrdersClient) references clients(idClient),
    constraint fk_orders_payment foreign key (idOrdersPayment) references payments(idPayment),
    constraint fk_orders_delivery foreign key (idOrdersDelivery) references Delivery(idDelivery)
);

-- Visualize table structure...
desc orders;

-- ***********************************************************************************************************

-- Criar tabela "productStorage"(Estoque)...
create table productStorage(
	-- Primary Key...
	idProdStorage int auto_increment primary key,
    
    -- Atribbutes...
    StorageLocation varchar(255) not null,
    Responsible varchar(50),
    Email varchar(50),
    Phone varchar(11)
);

-- Visualize table structure...
desc productStorage;

-- ***********************************************************************************************************

-- Criar tabela "supplier"(Fornecedor)...
create table supplier(
	-- Primary Key...
	idSupplier int auto_increment primary key,
    
    -- Atribbutes...
    Sname varchar(255) not null,
    Fname varchar(50),
    CNPJ char(14) not null,
    Address varchar(70),
    Responsible varchar(45),
    Email varchar(45),
    Contact varchar(11) not null,
    
    -- Constraints...
    constraint unique_supplier unique (CNPJ)
);
	
-- Visualize table structure...
desc supplier;

-- ***********************************************************************************************************
    
-- Criar tabela "seller"(Vendedor)...
create table seller(
	-- Primary Key...
	idSeller int auto_increment primary key,
    
    -- Atribbutes...
    Sname varchar(45) not null,
    Fname varchar(45),
    CPF_CNPJ char(14),
    contact varchar(11),
    location varchar(70),
    SellerName varchar(45),
    SellerEmail varchar(45),
    
    -- Constraints...
    constraint unique_cpf_cnpj_seller unique (CPF_CNPJ)
);

-- Visualize table structure...
desc seller;

-- ***********************************************************************************************************

-- Criar tabela "Delivery"(Entrega)...

create table Delivery(
	-- Primary Key...
	idDelivery int auto_increment primary key,
    
    -- Foreign Key...
    idDcarrier int,
    
    -- Atribbutes...
    SearchCode varchar(30),
    DeliveryTime int,
    FreightAmount float,
    
    -- Constraints...
    constraint fk_delivery_carrier foreign key (idDcarrier) references Carrier(idCarrier)
);

-- Visualize table structure...
desc Delivery;

-- ***********************************************************************************************************

-- Criar tabela "Carrier"(Transportadora)...

create table Carrier(
	-- Primary Key...
	idCarrier int auto_increment primary key,
    
    -- Atribbutes...
    Sname varchar(255) not null,
    Fname varchar(50),
    CNPJ varchar(14) not null,
    Responsible varchar(45),
    Email varchar(45),
    Phone varchar(11),
    
    -- Constraints...
    constraint unique_sname_carrier unique (Sname),
    constraint unique_cnpj_carrier unique (CNPJ)
);

-- Visualize table structure...
desc Carrier;

-- ***********************************************************************************************************
-- ***********************************************************************************************************

-- Tabelas de cardinalidade n para n...

-- ***********************************************************************************************************

-- create table "table"(
	-- Foreign Key...
	-- Relation Atribbutes...
	-- Primary Key - Composed Key...
	-- Constraints...
-- );
-- Visualize table structure...

-- ***********************************************************************************************************

-- Criar tabela "productSeller" (Relação de Produto por Vendedor - Terceiro):
create table productSeller(
	-- Foreign Key...
	idPseller int,
    idPproduct int,
    
    -- Relation Atribbutes...
    prodQuantity int default 1,
    
    -- Primary Key - Composed Key...
    primary key(idPseller, idPproduct),
    
    -- Constraints...
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_productseller_product foreign key (idPproduct) references product(idProduct)
);

-- Visualize table structure...
desc productSeller;

-- ***********************************************************************************************************

-- Criar tabela "productOrder" (Relação de Produto por Pedido):
create table productOrder(
	-- Foreign Key...
	idPOorder int,
    idPOproduct int,
    
    -- Relation Atribbutes...
    poQuantity int default 1,
    poStatus enum('Disponivel','Sem estoque') default 'Disponível',
    
    -- Primary Key - Composed Key...
    primary key(idPOorder, idPOproduct),
    
    -- Constraints...
    constraint fk_productorder_product foreign key (idPOproduct) references product(idProduct),
    constraint fk_product_order foreign key (idPOorder) references orders(idOrders)
);

-- Visualize table structure...
desc productOrder;

-- ***********************************************************************************************************

-- Criar tabela "storageLocation"(Relação de Produto em estoque):
create table storageLocation(
	-- Foreign Key...
	idLstorage int,
    idLproduct int,
    
    -- Relation Atribbutes...
    Quantity int not null default 0,
    
    -- Primary Key - Composed Key...
    primary key(idLstorage, idLproduct),
    
    -- Constraints...
    constraint fk_product_storagelocation foreign key (idLproduct) references product(idProduct),
    constraint fk_storagelocation_storage foreign key (idLstorage) references productStorage(idProdStorage)
);

-- Visualize table structure...
desc storageLocation;

-- ***********************************************************************************************************

-- Criar tabela "productSupplier"(Relação de Produto por Fornecedor):
create table productSupplier(
	-- Foreign Key...
	idPSsupplier int,
    idPSproduct int,
    
    -- Relation Atribbutes...
    Quantity int not null,
    
    -- Primary Key - Composed Key...
    primary key(idPSsupplier, idPSproduct),
    
    -- Constraints...
    constraint fk_productsupplier_supplier foreign key (idPSsupplier) references supplier(idSupplier),
    constraint fk_productsupplier_product foreign key (idPSproduct) references product(idProduct)
);

-- Visualize table structure...
desc productSupplier;

-- ***********************************************************************************************************