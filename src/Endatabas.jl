module Endatabas

using HTTP
using JSON3

export ENDB, query

struct ENDB
    endpoint::String
    http_options::Dict

    function ENDB(endpoint::String="http://localhost:3803/sql", http_options=Dict())
        return new(endpoint, http_options)
    end
end

function query(db::ENDB, sql::String)
    headers = ["Content-Type" => "application/json"]
    body = JSON3.write(Dict(:q => sql))
    res = HTTP.post(db.endpoint, headers, body; db.http_options...)
    return JSON3.read(res.body)
end

"""
    query(db::ENDB, sql::String, params; bulk::Bool=false)

Send a query to the database and return the resultset.

```julia-repl
julia> endb = ENDB()
ENDB("http://localhost:3803/sql", Dict{Any, Any}())

julia> query(endb, "SELECT 1")
1-element JSON3.Array{JSON3.Array, Vector{UInt8}, Vector{UInt64}}:
 [1]
```
"""
function query(db::ENDB, sql::String, params; bulk::Bool=false)
    headers = ["Content-Type" => "application/json"]
    body = JSON3.write(Dict(:q => sql, :p => params, :m => bulk))
    res = HTTP.post(db.endpoint, headers, body; db.http_options...)
    return JSON3.read(res.body)
end

end
