push!(LOAD_PATH, "../src/")
using Endatabas
using Documenter

DocMeta.setdocmeta!(Endatabas, :DocTestSetup, :(using Endatabas); recursive=true)

makedocs(;
    modules=[Endatabas],
    authors="contributors",
    sitename="Endatabas.jl",
    format=Documenter.HTML(;
        canonical="https://g-gundam.github.io/Endatabas.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "API" => "api.md",
        "Examples" => "examples.md",
    ],
)

deploydocs(;
    repo="github.com/g-gundam/Endatabas.jl",
    devbranch="main",
)
