using Plots
import Base: iterate, eltype, IteratorSize
using Base: SizeUnknown

struct Collatz n::Int end

function iterate(c::Collatz, n = c.n)
    if isnothing(n)
        nothing
    elseif isone(n)
        (1, nothing)
    elseif iseven(n)
        (n, n÷2)
    else
        (n, 3n+1)
    end
end

eltype(::Type{Collatz}) = Int

IteratorSize(::Type{Collatz}) = SizeUnknown()

collatz(n) = count(i -> true, Collatz(n))

scatter(1:100_000, collatz, 
    title = "Collatz Conjecture",
    xlabel = "n", ylabel = "steps to reach one",
    markerstrokewidth = 0, mc = :red, ms = 1,
    legend = false)