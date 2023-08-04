-- Script para Persistência de dados para teste de funcionamento do banco de dados:
-- Developed by Danilo Cesar ADS
-- ***********************************************************************************
-- insert into Table(filed1, field2,...,field n) values ('','',...,''),
	-- (),
    -- (),
    -- ();
    
-- select * from Table;
-- ***********************************************************************************

-- Selecionando a base de dados a ser utilizada...
use ecommerce;

-- Inserções em Clients:
insert into Clients(Email, Phone, Patio, Address, AddressNumber, Complement, Neighborhood, City, State, CEP) 
	values ('adriano.silva@gmail.com','11977664433','Rua','Santo Domingos','16','4','Nova Maua','Maua','SP','04392087'),
	('adriana.souza@hotmail.com','19984732323','Rua','Armando Figueira','16','B','Cambui','Campinas','SP','13947087'),
    ('francisca.gomes@gmail.com','19981565321','Av.','Senador Rodrigues','356','','São João','Paulinia','SP','14567197'),
    ('rafael.mariano@gmail.com','11987123884','Rua','São Paulo','242','','Capiburgo','São Mateus','SP','06530023'),
    ('compras@reidossanduiches.com.br','19976853433','Av.','Brigadeiro Heleno','67','D','Boiadeiros','Cosmopolis','SP','14563216'),
    ('diogo.ferrari@alugamotos.com.br','11976558744','Rua','Luiz de Camoes','555','','Centro','Osasco','SP','02260344');
-- Visualizando o resultado na tabela...
select * from Clients;
-- ***********************************************************************************
-- Inserções em NaturalPerson:
insert into NaturalPerson(idNPClient,Fname,Lname,CPF,Birthday) 
	values ('1','Adriano','Silva','32567419345','1995-03-22'),
	('2','Adriana','Souza','24560936489','1999-05-12'),
	('3','Francisca','Gomes','35487998009','2003-06-01'),
	('4','Rafael','Mariano','36578344490','2005-10-10');
-- Visualizando o resultado na tabela...
select * from NaturalPerson;
-- ***********************************************************************************
-- Inserções em LegalPerson:
insert into LegalPerson (idLPClient,Sname,Fname,CNPJ,Foundation)
	values ('5','severino da silva comercio.ltda','Rei dos Sanduiches','39583759372994','2010-05-23'),
    ('6','diogo ferrari cabral locacao de motos.ltda','Aluga Motos','69457753039553','2004-09-29');
-- Visualizando o resultado na tabela...
select * from LegalPerson;
-- ***********************************************************************************
-- Inserções em product:
insert into product(Pname, Pdescription,Category,Price,Ratio,Warranty,Length,Width,Height) 
	values ('Tablet Samsung Galaxy','Tablet 10 pol android 11 6GB RAM 64GB Wifi 4G','Eletronicos','1600.00','4','1','250','140','5'),
	('Fritadeira a ar Walita','Fritadeira a ar tipo Air Fryer','Eletroportateis','250.00','5','1','400','300','500'),
    ('Lego 150 peças','Jogo de 150 peças de montar lego','Brinquedos','110.00','5','1','300','300','200'),
    ('Celular Multi 7pol','Celular Multi 7pol 4G 32GB Android 9 Wifi 4G','Eletronicos','399.90','4','1','200','100','5');
-- Produto para verificar estoque baixo...
insert into product(Pname, Pdescription,Category,Price,Ratio,Warranty,Length,Width,Height) 
	values ('Nave Playmobil','Nave espacial com 30 pças Playmobil','Brinquedos','150.00','5','1','300','300','200');
-- Visualizando o resultado na tabela...
select * from product;
-- ***********************************************************************************
-- Inserções em creditcard:
insert into creditcard(OwnerName,CardNumber,Flag,ExpDate) 
	values ('ADRIANO SILVA','1234567812345679','Bandeira1','2024-08-30'),
	('ADRIANA SOUZA','1334567812345679','Bandeira1','2024-12-30'),
    ('FRANCISCA GOMES','1235567812345679','Bandeira2','2024-11-30'),
    ('RAFAEL MARIANO','1234567312345679','Bandeira3','2024-09-30'),
    ('SEVERINO SILVA','1234567812385679','Bandeira4','2024-03-30'),
    ('DIOGO F CABRAL','1234569812345679','Bandeira5','2024-10-30');
-- Visualizando o resultado na tabela...
select * from creditcard;
-- ***********************************************************************************
-- Inserções payments:
insert into payments(idPayClient,idPCreditcard,typePayment,boleto,pix) 
	values ('1','1','cartao','null','null'),
	('2','2','cartao','null','null'),
    ('3','3','cartao','null','null'),
    ('4','4','cartao','null','null'),
    ('5','5','cartao','null','null'),
    ('6','6','cartao','null','null');
-- Visualizando o resultado na tabela...
select * from payments;
-- ***********************************************************************************
-- Inserções em payments:
insert into orders(idOrdersClient,idOrdersPayment,idOrdersDelivery,ordersStatus) 
	values ('2','2','1','Em processamento'),
	('1','1','2','Em processamento'),
    ('3','3','3','Em processamento'),
    ('5','5','4','Em processamento'),
    ('4','4','5','Em processamento'),
    ('1','1','6','Em processamento'),
    ('3','3','7','Em processamento'),
    ('3','3','8','Em processamento'),
    ('6','6','9','Em processamento'),
    ('4','4','10','Em processamento'),
    ('5','5','11','Em processamento'),
    ('2','2','12','Em processamento');
-- Visualizando o resultado na tabela...    
select * from orders;
-- ***********************************************************************************
-- Inserções em productStorage:
insert into productStorage(StorageLocation,Responsible,Email,Phone) 
	values ('CD Jundiai SP','José Silvério','jose.silverio@ecommerce.com.br','19992347112');
-- Visualizando o resultado na tabela...    
select * from productStorage;
-- ***********************************************************************************
-- Inserções em supplier:
insert into supplier(Sname,Fname,CNPJ,Address,Responsible,Email,Contact) 
	values ('Samsung armazenagem de eletronicos.sa','Samsung','57956575095655','Rod Bandeirantes 10000 Campinas SP','Sabino Moreira','sabino.moreira@samsung.com.br','19982236755'),
	('Wallita Eletroportateis.sa','Wallita','57956575095656','Rod Castelo Branco 6543 São Paulo SP','Marcia Mendes','marcia.mendes@wallita.com.br','11988863116'),
    ('Lego brinquedos.sa','Lego','57956575095657','Rod Anhanguera 1000 São Paulo SP','Wellington Eduardo','wellington.eduardo@lego.com.br','11983456779'),
    ('Multilaser eletronicos.sa','Multi','57956575095658','Rod Dutra 2000 São Paulo SP','Lucas Silveira','lucas.silveira@multi.com.br','11982247616');
-- Visualizando o resultado na tabela... 
select * from supplier;
-- ***********************************************************************************
-- Inserções em seller:
insert into seller(Sname,Fname,CPF_CNPJ,contact,location,SellerName,SellerEmail) 
	values ('Adalberto Berdinasi comercio.ltda','Loja do celula','39485760192801','41998563444','Av João das neves 233 centro Bauru SP','Adalberto Berdinasi','adalberto.berdinasi@gmail.com'),
	('José Riscado',null,'33374789140','11983465576','Rua José Bonifacio 45 Ipiranga São Paulo SP','José Riscado','jose.riscado@gmail.com');
-- Fornecedor que também é vendedor para a consulta de teste...
insert into seller(Sname,Fname,CPF_CNPJ,contact,location,SellerName,SellerEmail) 
	values ('Multilaser eletronicos.sa','Multi','57956575095658','11982247616','Rod Dutra 2000 São Paulo SP','Lucas Silveira','lucas.silveira@multi.com.br');

-- Visualizando o resultado na tabela... 
select * from seller;
-- ***********************************************************************************
-- Inserções em Delivery:
insert into Delivery(idDcarrier,SearchCode,DeliveryTime,FreightAmount) 
	values ('1','D00000000000001','5','35.00'),
	('1','D00000000000002','7','42.00'),
    ('1','D00000000000003','3','25.00'),
    ('1','D00000000000004','5','35.00'),
	('1','D00000000000005','6','98.00'),
	('1','D00000000000006','10','145.00'),
	('1','D00000000000007','2','50.00'),
	('1','D00000000000008','4','40.00'),
	('1','D00000000000009','5','35.00'),
	('1','D00000000000010','5','35.00'),
    ('1','D00000000000011','6','77.00'),
    ('1','D00000000000012','2','35.00');
-- Visualizando o resultado na tabela... 
select * from Delivery;
-- ***********************************************************************************
-- Inserções em Carrier:
insert into Carrier(Sname,Fname,CNPJ,Responsible,Email,Phone) 
	values ('Empresa brasileira de correios.sa','Correios','26039586638563','José Mauricio','jose.mauricio@correios.com.br','11987722345');
-- Visualizando o resultado na tabela... 
select * from Carrier;
-- ***********************************************************************************

-- Inserts de cardinalidade n para n...

-- ***********************************************************************************
-- Inserções em productSeller:
insert into productSeller(idPseller,idPproduct,prodQuantity) 
	values ('1','1','20'),
	('2','1','10');
-- Visualizando o resultado na tabela... 
select * from productSeller;
-- ***********************************************************************************
-- Inserções em productOrder:
insert into productOrder(idPOorder,idPOproduct,poQuantity,poStatus) 
	values ('1','1','2','Disponível'),
	('1','2','2','Disponível'),
    ('2','1','1','Disponível'),
    ('2','3','1','Disponível'),
    ('3','4','1','Disponível'),
    ('4','3','1','Disponível'),
    ('5','2','1','Disponível'),
    ('6','1','1','Disponível'),
    ('7','4','1','Disponível'),
    ('8','4','1','Disponível'),
    ('9','3','4','Disponível'),
    ('10','2','1','Disponível'),
    ('11','1','1','Disponível'),
    ('12','3','2','Disponível');
-- Visualizando o resultado na tabela... 
select * from productOrder;    
-- ***********************************************************************************
-- Inserções em storageLocation:
insert into storageLocation(idLstorage,idLproduct,Quantity) 
	values ('1','1','100'),
	('1','2','100'),
    ('1','3','100'),
    ('1','4','100');
-- Produto com estoque baixo...
insert into storageLocation(idLstorage,idLproduct,Quantity) 
	values ('1','5','2');
-- Visualizando o resultado na tabela...
select * from storageLocation;
-- ***********************************************************************************
-- Inserções em productSupplier:
insert into productSupplier(idPSsupplier,idPSproduct,Quantity) 
	values ('1','1','200'),
	('2','2','200'),
    ('3','3','200'),
    ('4','4','200');
-- Visualizando o resultado na tabela...
select * from productSupplier;
-- ***********************************************************************************