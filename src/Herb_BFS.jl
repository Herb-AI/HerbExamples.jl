using Revise

include("../../src/Herb.jl")

×(a, b) = a * b

g₁ = Herb.HerbGrammar.@cfgrammar begin
    Real = |(0:3)
    Real = a
    Real = Real + Real
    Real = Real × Real
end

problem = Herb.HerbData.Problem([Herb.HerbData.IOExample(Dict(:x => x), 3x) for x ∈ 1:5], "example")

Herb.HerbSearch.enumerative_search(g₁, problem, 3, Herb.HerbSearch.ContextFreeBFSEnumerator)
