# Mermaid-DBs
Diagramas de entidade-relacionamento para bancos de dados utilizando o Mermaid.

---

## Base Geográfica

```mermaid
erDiagram
    Regioes {
        int IdRegiao PK
        varchar(2) CodRegiao
        varchar(20) NomeRegiao
    }
    
    Estados {
        char(2) SiglaEstado PK
        varchar(20) NomeEstado
        varchar(20) NomeCapital
        int IdRegiao FK
    }

    Regioes ||--o{ Estados: contains
```

## Base Comercial

```mermaid
erDiagram
    Estado_Civil {
        char(1) Cd_Estado_Civil PK
        varchar(50) Nome_Estado_Civil
    }

    Clientes {
        int Id_Cliente PK
        varchar(100) Nome_Cliente
        date Dt_Nascimento
        char(1) Cd_Estado_Civil FK
    }

    Filiais {
        int Id_Filial PK
        varchar(100) Nm_Filial
    }

    Funcionarios {
        int Id_Funcionario PK
        varchar(100) Nm_Funcionario
        date Dt_Nascimento
        char(1) Cd_Estado_Civil FK
        numeric Vl_Salario "numeric(18,2)"
        int Id_Filial FK
    }

    Produtos {
        int Id_Produto PK
        varchar(100) Nm_Produto
        numeric Vl_Custo "numeric(18,2)"
        numeric Vl_Preco_Venda "numeric(18,2)"
    }

    Pedidos {
        int Id_Pedido PK
        datetime2 Dt_Pedido
        int Id_Cliente FK
        int Id_Vendedor FK
    }

    Pedidos_Itens {
        int Id_Pedido_Item PK
        int Id_Pedido FK
        int Id_Produto FK
        int Qt_Vendida
        numeric Vl_Unitario "numeric(18,2)"
    }

    Estado_Civil ||--o{ Clientes: has
    Estado_Civil ||--o{ Funcionarios: has
    Filiais ||--o{ Funcionarios: has
    Clientes ||--o{ Pedidos: places
    Funcionarios ||--o{ Pedidos: processes
    Pedidos ||--o{ Pedidos_Itens: contains
    Produtos ||--o{ Pedidos_Itens: includes
```