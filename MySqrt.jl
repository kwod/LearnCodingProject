function mysqrt(x, N = 10)
    t = 1
    for i in 1:N
        t = (t + x/t)/2
    end
    return t
end