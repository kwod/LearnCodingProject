using Plots

function mysqrt(x, N)
    t = 1
    for i in 1:N
        t = (t + x/t)/2
    end
    t
end

function mysqrt(x)
    t₀, t₁ = one(x), x
    while t₀ ≠ t₁
        t₀, t₁ = t₁, (t₁ + x/t₁)/2
    end
    t₁
end

mysqrt(3)

plot(range(0,50; length = 500),
    [[x -> mysqrt(x, i) for i in 1:5]..., √],
    label = hcat(["Iteration $i" for i in 1:5]..., "√"))