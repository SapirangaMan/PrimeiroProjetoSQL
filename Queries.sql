use ecommerce;

-- Quantidade de clientes no sistema:
Select count(*) from cliente;

-- Quantidade de pedidos por cliente
Select concat(c.nome,' ',c.sobrenome) as Cliente, c.PF_PJ,p.Descricao,p.Status 
from pedido p, cliente c 
where p.Cliente_idCliente = c.idCliente;

select ped.idPedido, sum(pp.Quantidade) as qtd, pro.valor
from pedido ped, produtopedido pp, produto pro
where ped.idPedido = pp.Pedido_idPedido and pro.idProduto = pp.Produto_idProduto;



