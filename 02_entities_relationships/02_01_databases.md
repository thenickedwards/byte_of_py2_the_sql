# DATABASES

    **WHAT IS A DATABASE?**
    *A structured set of data held in a computer, especially one that is accessible in various ways (Oxford)*

## Types of Databases

- **Flat file**
  - Resembles spreadsheet
  - Data stored in rows and columns
  - Few constraints
- **Relational (SQL)**
  - Composed of tables and references
  - Describes entities and relationships btw them
  - Data is well-structured
- **Schemaless (Schema-less, NoSQL)**
  - Composed of arbitrary objects
  - Objects can be grouped into collections
- **Key-Value Store**
  - Composed of kvps
  - Programming interface like Python dictionary
  - Key is usual sa syringe but can be any supported data type

### Relational Model

_(Edgar F Cobb at IBM in 1970)
Set apart by paradigm that formally defines structure of entities and relationships present in data_
**Entity**

- Named object composed of data fields (AKA attributes or properties)
- Attributes can be any primitive data type (e.g. integer, string, Boolean)
- Additional data types in Postgres (e.g. timestamp, UUID)
- Classes represent Entities in object-oriented programming (OOP)
