DROP TABLE IF EXISTS dbo.Estado_Civil;

CREATE TABLE dbo.Estado_Civil (
    Cd_Estado_Civil CHAR(1) NOT NULL PRIMARY KEY CLUSTERED,
    Nome_Estado_Civil VARCHAR(50) NOT NULL
)

INSERT INTO dbo.Estado_Civil
VALUES 
    ('S', 'Solteiro(a)'),
    ('C', 'Casado(a)'),
    ('D', 'Divorciado(a)'),
    ('V', 'Viúvo(a)')


DROP TABLE IF EXISTS dbo.Clientes;

CREATE TABLE dbo.Clientes (
    Id_Cliente INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
    Nome_Cliente VARCHAR(100) NOT NULL,
    Dt_Nascimento DATE NOT NULL,
    Cd_Estado_Civil CHAR(1) NOT NULL,
    FOREIGN KEY (Cd_Estado_Civil) REFERENCES dbo.Estado_Civil(Cd_Estado_Civil)
)


DROP TABLE IF EXISTS dbo.Filiais;

CREATE TABLE dbo.Filiais (
    Id_Filial INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
    Nm_Filial VARCHAR(100) NOT NULL
)


DROP TABLE IF EXISTS dbo.Funcionarios;

CREATE TABLE dbo.Funcionarios (
    Id_Funcionario INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
    Nm_Funcionario VARCHAR(100) NOT NULL,
    Dt_Nascimento DATE NOT NULL,
    Cd_Estado_Civil CHAR(1) NOT NULL,
    Vl_Salario NUMERIC(18, 2) NOT NULL,
    Id_Filial INT NOT NULL,
    FOREIGN KEY (Cd_Estado_Civil) REFERENCES dbo.Estado_Civil(Cd_Estado_Civil),
    FOREIGN KEY (Id_Filial) REFERENCES dbo.Filiais(Id_Filial)
)


DROP TABLE IF EXISTS dbo.Produtos;

CREATE TABLE dbo.Produtos (
    Id_Produto INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
    Nm_Produto VARCHAR(100) NOT NULL,
    Vl_Custo NUMERIC(18, 2) NOT NULL,
    Vl_Preco_Venda NUMERIC(18, 2) NOT NULL
)


DROP TABLE IF EXISTS dbo.Pedidos;

CREATE TABLE dbo.Pedidos (
    Id_Pedido INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
    Dt_Pedido DATETIME2 NOT NULL,
    Id_Cliente INT NOT NULL,
    Id_Vendedor INT NOT NULL,
    FOREIGN KEY (Id_Cliente) REFERENCES dbo.Clientes(Id_Cliente),
    FOREIGN KEY (Id_Vendedor) REFERENCES dbo.Funcionarios(Id_Funcionario)
)


DROP TABLE IF EXISTS dbo.Pedidos_Itens;

CREATE TABLE dbo.Pedidos_Itens (
    Id_Pedido_Item INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
    Id_Pedido INT NOT NULL,
    Id_Produto INT NOT NULL,
    Qt_Vendida INT NOT NULL,
    Vl_Unitario NUMERIC(18, 2) NOT NULL,
    FOREIGN KEY (Id_Pedido) REFERENCES dbo.Pedidos(Id_Pedido),
    FOREIGN KEY (Id_Produto) REFERENCES dbo.Produtos(Id_Produto)
)