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
