-- criação do banco de dados para o cenario de e-comerce

create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table clients(
	id_client int auto_increment primary key,
    f_name varchar(10),
    m_init char(3),
    l_name varchar(20),
    cpf char(11) not null,
    address varchar(30),
    constraint unique_cpf_client unique (cpf)
);

alter table clients auto_increment=1;


-- criar tabela produto
create table product(
	id_product int auto_increment primary key,
    p_name varchar(10) not null,
    classification_kids bool default false,
    category enum('Eletrônico', 'Vestimento', 'Brinquedos', 'Alimentos', 'Móveis') not null,
    rate float default 0,
    size varchar(10)
);

alter table product auto_increment=1;

create table product_supplier( 
	id_product_supplier int,
    id_product_supplier_product int,
    quantity int not null,
    primary key (id_product_supplier, id_product_supplier_product),
    constraint fk_product_supplier_supplier foreign key (id_product_supplier) references supplier(id_supplier),
    constraint fk_product_supplier_product foreign key (id_product_supplier_product) references product(id_product)
);


-- criar tabela pedido
create table orders(
	id_order int auto_increment primary key,
    id_order_client int,
    order_status enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
    order_description varchar(255),
    send_value float default 10,
    payment_cash bool default false,
    constraint fk_orders_client foreign key (id_order_client) references clients(id_client)
);

alter table orders auto_increment=1;

-- criar tabela estoque

create table stock(
	id_stock int auto_increment primary key,
    location_stock varchar(255),
    quantity int default 0,
    payment_cash bool default false
);

alter table stock auto_increment=1;

create table product_seller(
	id_product_seller int,
    id_product int,
    quantity int default 1,
    primary key (id_product_seller, id_product),
    constraint fk_product_seller foreign key (id_product_seller) references seller(id_seller),
    constraint fk_product_product foreign key (id_product) references product(id_product)
    
);



-- criar tabela fornecedor
create table supplier(
	id_supplier int auto_increment primary key,
    name_corporation varchar(45),
    cnpj char(15) not null,
    contact varchar(11) default 0,
    constraint unique_supplier unique (cnpj)
);

alter table supplier auto_increment=1;

-- criar tabela vendedor

create table seller(
	id_seller int auto_increment primary key,
    name_corporation varchar(45),
    abstract_name varchar(255),
    cnpj char(15),
	cpf char(11),
    location varchar(255),
    contact varchar(11) not null,
    constraint unique_cnpj_seller unique (cnpj),
    constraint unique_cpf_seller unique (cpf)
);

alter table seller auto_increment=1;

-- criar tabela produtos/vendedor

create table product_order(
	id_p_product int,
    id_product_order int,
    product_quantity int default 1,
    product_status enum('Disponivel', 'Sem estoque') default 'Disponivel',
    primary key (id_p_product, id_product_order),
    constraint fk_product_seller foreign key (id_p_product) references product(id_product),
    constraint fk_product_product foreign key (id_product_order) references orders(id_order)
);


create table stock_location(
	id_location_product int,
    id_location_stock int,
    location varchar(255) not null,
    primary key(id_location_product, id_location_stock),
    constraint fk_stock_location_product foreign key (id_location_product) references product(id_product),
    constraint fk_storage_location_storage foreign key (id_location_stock) references stock(id_stock)
);

select * from stock_location;

use ecommerce;

insert into clients (f_name, m_init, l_name, cpf, address) 
	   values('Maria','M','Silva', 12346789, 'rua silva de prata 29, Carangola - Cidade das flores'),
		     ('Matheus','O','Pimentel', 987654321,'rua alemeda 289, Centro - Cidade das flores'),
			 ('Ricardo','F','Silva', 45678913,'avenida alemeda vinha 1009, Centro - Cidade das flores'),
			 ('Julia','S','França', 789123456,'rua lareijras 861, Centro - Cidade das flores'),
			 ('Roberta','G','Assis', 98745631,'avenidade koller 19, Centro - Cidade das flores'),
			 ('Isabela','M','Cruz', 654789123,'rua alemeda das flores 28, Centro - Cidade das flores');
             
select * from clients;

insert into product (p_name, classification_kids, category, rate, size) values
							  ('Fone de ouvido',false,'Eletrônico','4',null),
                              ('Barbie Elsa',true,'Brinquedos','3',null),
                              ('Body Carters',true,'Vestimenta','5',null),
                              ('Microfone Vedo - Youtuber',False,'Eletrônico','4',null),
                              ('Sofá retrátil',False,'Móveis','3','3x57x80'),
                              ('Farinha de arroz',False,'Alimentos','2',null),
                              ('Fire Stick Amazon',False,'Eletrônico','3',null);
select * from product;

insert into orders (id_order_client, order_status, order_description, send_value, payment_cash) values 
							 (1, default,'compra via aplicativo',null,1),
                             (2,default,'compra via aplicativo',50,0),
                             (3,'Confirmado',null,null,1),
                             (4,default,'compra via web site',150,0);
select * from orders;

insert into product_order (id_p_product, id_product_order, product_quantity, product_status) values
						 (1,5,2,null),
                         (2,5,1,null),
                         (3,6,1,null);
                         
insert into stock (location_stock,quantity) values 
							('Rio de Janeiro',1000),
                            ('Rio de Janeiro',500),
                            ('São Paulo',10),
                            ('São Paulo',100),
                            ('São Paulo',10),
                            ('Brasília',60);
                            
insert into stock_location (id_location_product, id_location_stock, location) values
						 (1,2,'RJ'),
                         (2,6,'GO');

insert into supplier (name_corporation, cnpj, contact) values 
							('Almeida e filhos', 123456789123456,'21985474'),
                            ('Eletrônicos Silva',854519649143457,'21985484'),
                            ('Eletrônicos Valma', 934567893934695,'21975474');
                            
insert into product_supplier (id_product_supplier, id_product_supplier_product, quantity) values
						 (1,1,500),
                         (1,2,400),
                         (2,4,633),
                         (3,3,5),
                         (2,5,10);
                         
insert into seller (name_corporation, abstract_name, cnpj, cpf, location, contact) values 
						('Tech eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
					    ('Botique Durgas',null,null,123456783,'Rio de Janeiro', 219567895),
						('Kids World',null,456789123654485,null,'São Paulo', 1198657484);

insert into product_seller (id_product_seller, id_product, quantity) values 
						 (1,6,80),
                         (2,7,10);
                         
insert into orders (id_order_client, order_status, order_description, send_value, payment_cash) values 
							 (2, default,'compra via aplicativo',null,1);





