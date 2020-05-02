@testset "OneMax" begin

    # Initial population
    N = 100
    initpop = (() -> BitArray(rand(Bool, N)))

    function Evolutionary.trace!(record::Dict{String,Any}, objfun, state, population, method::GA, options)
        idx = sortperm(state.fitpop)
        record["fitpop"] = state.fitpop[idx[1:5]]
    end

    res = Evolutionary.optimize(
        x -> -sum(x),                 # Function to MINIMIZE
        initpop,
        GA(
            selection = uniformranking(3),
            mutation =  flip,
            crossover = twopoint,
            mutationRate = 0.6,
            crossoverRate = 0.2,
            populationSize = 100,
        ),
        Evolutionary.Options(successive_f_tol = 20,iterations = 1500, store_trace=true));
    println("GA:UR(3):FLP:SP (OneMax: 1/sum) => F: $(minimum(res)), C: $(Evolutionary.iterations(res))")
    @test sum(Evolutionary.minimizer(res)) >= N-1
    @test abs(minimum(res)) >= N-1
    @test Evolutionary.trace(res)[end].metadata["fitpop"][1] == minimum(res)

end
