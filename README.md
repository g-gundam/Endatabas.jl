# Endatabas.jl

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://g-gundam.github.io/Endatabas.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://g-gundam.github.io/Endatabas.jl/dev/)
[![Build Status](https://github.com/g-gundam/Endatabas.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/g-gundam/Endatabas.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/g-gundam/Endatabas.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/g-gundam/Endatabas.jl)

A client library for the Endatabas database

## What is Endatabas?

- [Endatabas](https://www.endatabas.com/) is one of the most fascinating databases I've encountered recently.
- It's schemaless
  + ...but it can be queried with SQL.
- You can just start inserting data and tables will autovivify.
  + The rows you insert can contain nested data.
  + Rows are structured documents.
- Its dialect of SQL can have a JSON-ish accent at times which feels natural if you're accustomed to JSON.
- It maintains an "immutable" history of the database, and you can query the database about past states.
- It was written by the developer of XTDB which is also cares a lot about time.
- It's implemented in a combination of Rust and Common Lisp.
- They have a docker container that makes it really easy to get started with it.

## Installation

```julia-repl
julia> ]
(@v1.10) pkg> add Endatabas
```
  
## Usage

```julia
# This exports ENDB and query(endb, sql, params)
using Endatabas 

# Construct ENDB handle
endb = ENDB()

# Query
query(endb, "INSERT INTO issues {id: 1, title: ?}", ["Weird query crashes server"])
query(endb, "SELECT * FROM issues")
query(endb, "SELECT id, title FROM issues")
query(endb, "SELECT {id, title} FROM issues")
```
