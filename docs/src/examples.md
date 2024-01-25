# Examples

## Authentication

Create the `ENDB` struct with a username and password like this.

```julia
endb = ENDB("http://username:password@localhost:3803/sql")
```

## Positional Parameters

Use `?` to denote a positional parameter, and pass in a Vector of values to
be used as a substitution.

```julia
query(endb, "SELECT id, title FROM issues WHERE id > ?", [5])
```

## Named Parameters

Use symbols with a leading ":" (like `:id` in this example) and pass in a Dict
with keys and values to be used as substitutions.

```julia
query(endb, "SELECT id, title FROM issues WHERE id > :id", Dict(:id => 5))
```

## Bulk Insert

Bulk insert using positional parameters is done by passing in a 
Vector of Vectors and setting `bulk=true`.

```julia
query(endb, "INSERT INTO issues (id, title) VALUES (?, ?)", 
    [
        [1, "Weird query crashes server"],
        [2, "Obscure query returns wrong results"]
    ]; 
    bulk=true
)
```

Bulk insert with named parameters is done by passing in a
Vector of Dicts and setting `bulk=true`.

```julia
query(endb, "INSERT INTO issues {id: :id, title: :title}",
    [
        Dict(:id => 3, :title => "Unique constraint not working"),
        Dict(:id => 4, :title => "Erasure failed")
    ];
    bulk=true
)
```

