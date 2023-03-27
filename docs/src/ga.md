# Genetic Algorithm

```@docs
GA
```

## Description

The [Genetic Algorithm](https://en.wikipedia.org/wiki/Genetic_algorithm)  is a metaheuristic inspired by the process of natural selection that belongs to the larger class of evolutionary algorithms (EA). Genetic algorithms are commonly used to generate high-quality solutions to optimization and search problems by relying on biologically inspired operators such as [Mutation](@ref), [Crossover](@ref) and [Selection](@ref) [^1].

## Parameters 

- `populationSize`: The size of the population
- `crossoverRate`: The fraction of the population at the next generation, not including elite children, that is created by the crossover function.
- `mutationRate`: Probability of chromosome to be mutated
- `ɛ`/`epsilon`: Positive integer specifies how many individuals in the current generation are guaranteed to survive to the next generation. Floating number specifies fraction of population.
- `selection`: [Selection](@ref) function (default: [`tournament`](@ref))
- `crossover`: [Crossover](@ref) function (default: [`genop`](@ref))
- `mutation`: [Mutation](@ref) function (default: [`genop`](@ref))
- `pop_dependent`: Boolean that should be set to true when a optimization function dependent on other members of the population are used. 
- `metrics` is a collection of convergence metrics.
  
## References

[^1]: [http://www.scholarpedia.org/article/Genetic_algorithms](http://www.scholarpedia.org/article/Genetic_algorithms)
