show databases;
use ecommerce;

show tables;

-- DELETE FROM CLIENTE;
-- Inserindo clientes PF
INSERT INTO CLIENTE(NOME, SOBRENOME, PF_PJ, CPF, contato, endereco, DtNascimento)
	VALUES ('Maria', 'Joaquina', 'PF', '02802802825', '123456789','Praça da bandeira, Salvador - BA','2000-10-10'),
            ('Antonio','Santos','PF','12332112302','','Rua Vitoria, 32, Centenário, Sapiranga - RS','1992-05-31'),
            ('Maria', 'Schneider','PF','12332112355','11212121212','Rua altamira, 556 casa 5, Porto Alegre - RS','1960-01-15'),
            ('Robson', 'Soares', 'PF', '32112332155','321123321','Rua da ladeira, 99, Sapiranga - RS','2000-06-28');
 
-- Inserindo clientes PJ 
INSERT INTO CLIENTE(NOME, SOBRENOME, PF_PJ, CNPJ, contato, endereco, DtNascimento)
	VALUES ('Rei dos eletronicos','LTDA', 'PJ', '12123321000123','123321123','Santa Efigenia, São Paulo - SP','2015-08-01'),
			('Eletronica Silveira','LTDA', 'PJ', '33222111000123','55522211','Camelodromo, Porto Alegre - RS','2019-02-15'),
            ('Sapiranga Eletronicos','LTDA', 'PJ', '11222333000123','123321123','Centro, Sapiranga - RS','1998-12-01');
ALTER TABLE CLIENTE auto_increment = 1;
select * from cliente;

-- QUANDO CRIEI A TABELA, USEI INT NO VALOR
ALTER TABLE PRODUTO modIFY COLUMN Valor float;
INSERT INTO PRODUTO(Categoria, Descricao, Valor)
	values ('PERIFERICOS','MOUSE 12000DPI RAZOR',220.50),
			('PERIFERICOS','TECLADO WIRELESS RAZOR',319.99),
            ('MONITORES','AOC 23 POL',1199.99),
            ('CPU','I5 13TH GEN',1580.00);
ALTER TABLE PRODUTO auto_increment = 1;
select * from produto;

INSERT INTO PEDIDO(Descricao, prioridade,cliente_idCliente, status, frete)
	values ('Compra via app', default,1,default,20),
			('Compra via app','Alta',3,'transporte',0),
            ('Compra via site',default,5,'transporte',150),
            ('Compra via site','Media',7,default,55),
			('Compra via site',default,7,default,55);
ALTER TABLE PEDIDO auto_increment = 1;

SELECT * FROM PEDIDO p,CLIENTE c where p.Cliente_idCliente = c.idCliente;

INSERT INTO produtopedido(produto_idProduto,Pedido_idPedido,Quantidade, status)
	values(1,1,1,default),
			(1,2,1,default),
            (2,3,1,default),
            (3,4,1,default),
            (4,4,2,default),
            (5,4,1,default),
            (5,3,1,default);
select * from produtopedido;

INSERT INTO estoque(local,Quantidade)
	values('São Paulo', 500),
			('Porto Alegre',1500);
ALTER TABLE estoque auto_increment = 1;
select * from estoque;

INSERT INTO produtoemestoque(produto_idProduto,Estoque_idEstoque,local)
	values(1,2,'RS'),
			(2,2,'RS'),
            (3,1,'SP'),
            (4,1,'SP');

-- adicionando fornecedores
INSERT INTO FORNECEDOR(RazaoSocial, CNPJ, contato)
	VALUES ('AOC Representações LTDA', '12123321000120','123321123'),
			('Razor LTDA','33215111000123','55522211'),
            ('Intell LTDA','00222333000123','123321123');
ALTER TABLE fornecedor auto_increment = 1;
select * from fornecedor;  

INSERT INTO produtoFornecedor(produto_idProduto,fornecedor_idFornecedor)
	values(1,2),
			(2,2),
            (3,1),
            (4,3);
    
-- inserindo vendedores
INSERT INTO vendedor(RazaoSocial, NomeFantasia, endereco, CPF, CNPJ)
	VALUES ('Jorge da Silva','Jorge da Silva', 'Santa Efigenia, São Paulo - SP','12345698744',null),
			('Representações Lindomar','Casa das Maquinas', 'Camelodromo, Porto Alegre - RS', null, '33222111000123');
ALTER TABLE vendedor auto_increment = 1;
select * from vendedor;
    
INSERT INTO produtoVendedor(produto_idProduto,vendedor_idVendedor,quantity)
	values(1,2,10),
			(2,2, 20),
            (3,1, 60),
            (4,1, 30),
            (5,2, 40);

SELECT * FROM PEDIDO;
INSERT INTO pagamento(TipoPagamento,Pedido_idPedido,Pedido_Cliente_idCliente)
	VALUES('PIX',1,1),
			('PIX',2,3),
            ('CARTAO',3,5),
            ('CARTAO',3,5),
            ('CARTAO',4,7),
            ('PIX',4,7),
            ('PIX',5,7);