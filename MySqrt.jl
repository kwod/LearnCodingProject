function mysqrt(x, N = 10)
    t = 1
    for _ = 1:N
        t = (t + x/t)/2
    end
    return t
end

(mysqrt(3), √3)

using Plots

fs = [x -> mysqrt(x, i) for i in 1:5]

plot(range(0,50; length = 500), [fs..., √],
    label = hcat(["Iteration $i" for i in 1:5]..., "√"))