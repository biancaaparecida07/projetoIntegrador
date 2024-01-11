create database projeto;
use projeto;
 
-- CRIAÇÃO DE TABELA PRODUTO
CREATE TABLE Produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(20),
    categoria_produto INT
);

-- CRIAÇÃO DE TABELA MATERIA PRIMA
CREATE TABLE materia_prima (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    valor_unitario float
);

-- CRIAÇÃO DE TABELA DE ESTOQUE DE PRODUTOS
CREATE TABLE estoque_produtos (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    data_entrada DATE,
    data_saida DATE,
    qtde_inicial INT,
    qtde_entrada INT,
    id_produto INT,
    FOREIGN KEY (id_produto) REFERENCES produtos(id)
);

-- CRIAÇÃO DE TABELA DE ESTOQUE DE MATERIA PRIMA
CREATE TABLE estoque_materiaPrima (
    id INT PRIMARY KEY AUTO_INCREMENT,
    data_entrada DATE,
    data_saida DATE,
    qtde_inicial INT,
    qtde_entrada INT,
    id_materiaPrima INT,
    FOREIGN KEY (id_materiaPrima) REFERENCES materia_prima(id)
);

-- CRIAÇÃO DE TABELA DE RELACIONAMENTO DE MATÉRIA PRIMA COM PRODUTO.
create table materiaPrima_produto(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_materiaPrima INT,
    FOREIGN KEY (id_materiaPrima) REFERENCES materia_prima(id),
    id_produto INT,
    FOREIGN KEY (id_produto) REFERENCES produtos(id)
);
 
-- Adicionando colunas de quantidade de saída nas tabelas de estoques.
alter table estoque_produtos add column qtde_saida int;
alter table estoque_materiaPrima add column qtde_saida int;

#CRIAÇÃO DE TABELA FORNECEDOR
-- Tabela fornecedor
 
CREATE TABLE fornecedor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50)
);

create table materiaPrima_fornecedor(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_materiaPrima INT,
    FOREIGN KEY (id_materiaPrima) REFERENCES materia_prima(id),
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id)
);
