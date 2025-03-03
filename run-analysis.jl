include("src//TulipaEnergyModel.jl") 
using Gurobi


input_dir = joinpath(@__DIR__,"Cases\\1h")
output_dir = joinpath(@__DIR__,"Cases\\1h\\output")

energy_problem = TulipaEnergyModel.run_scenario(input_dir,
                              optimizer = Gurobi.Optimizer,
                              parameters= Dict("Method" => 2,"MIPGap"=> 0.001))

TulipaEnergyModel.save_solution_to_file(output_dir, energy_problem)
