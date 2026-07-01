# Data Model (Star Schema)

Entity-Relationship Diagram representing the dimensional model deployed in the Gold layer, optimized for analytical queries.

```mermaid
erDiagram
    gold_dim_customers ||--o{ gold_fact_sales : "Filters"
    gold_dim_products ||--o{ gold_fact_sales : "Filters"

    gold_dim_customers {
        int customer_key PK
        int customer_id
        string customer_number
        string first_name
        string last_name
        string country
        string marital_status
        string gender
        date birthdate
    }

    gold_fact_sales {
        string order_number
        int product_key FK
        int customer_key FK
        date order_date
        date shipping_date
        date due_date
        float sales_amount
        int quantity
        float price
    }

    gold_dim_products {
        int product_key PK
        int product_id
        string product_number
        string product_name
        int category_id
        string category
        string subcategory
        string maintenance
        float cost
        string product_line
        date start_date
    }
```
