include("Herb.jl")

using .Herb
using Revise

×(a, b) = a * b

g₁ = Herb.Grammars.@cfgrammar begin
    Real = |(0:3)
    Real = x
    Real = Real + Real
    Real = Real × Real
end

problem = Herb.Data.Problem([Herb.Data.IOExample(Dict(:x => x), 3x) for x ∈ 1:5], "example")

# enumerator = Herb.Search.ContextFreeBFSEnumerator(g₁, 2, :Real)

# for e ∈ enumerator
#     expr = Herb.Grammars.rulenode2expr(e, g₁)
#     if expr isa Expr && (expr.args[1] == :* && expr.args[2] == 3 || expr.args[1] == :+ && expr.args[2] == 0) || expr isa Int || expr isa Symbol
#     @show expr
#     end
# end

Herb.Search.enumerative_search(g₁, problem, 3, Herb.Search.ContextFreeBFSEnumerator)
