using Revise

include("../../src/Herb.jl")

×(a, b) = a * b

g₁ = Herb.Grammars.@cfgrammar begin
    Real = |(0:3)
    Real = a
    Real = Real + Real
    Real = Real × Real
end

problem = Herb.Data.Problem([Herb.Data.IOExample(Dict(:x => x), 3x) for x ∈ 1:5], "example")

Herb.Search.enumerative_search(g₁, problem, 3, Herb.Search.ContextFreeBFSEnumerator)
