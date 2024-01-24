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
    res = HTTP.post(db.endpoint, headers, body)
    return JSON3.read(res.body)
end

function query(db::ENDB, sql::String, params; bulk::Bool=false)
    headers = ["Content-Type" => "application/json"]
    body = JSON3.write(Dict(:q => sql, :p => params, :m => bulk))
    res = HTTP.post(db.endpoint, headers, body)
    return JSON3.read(res.body)
end

end
