using Mimi
using Base.Test

# For now, use the warn function; for 0.7/1.0, remove this and use real logging...
macro info(msg)
    msg = "\n$msg"
    :(Base.println_with_color(:light_blue, $msg, bold=true))
end


@testset "Mimi" begin
    @info("test_main.jl")
    include("test_main.jl")

    @info("test_metainfo.jl")
    include("test_metainfo.jl")

    @info("test_references.jl")
    include("test_references.jl")

    @info("test_units.jl")
    include("test_units.jl")

    @info("test_model_structure.jl")
    include("test_model_structure.jl")

    @info("test_tools.jl")
    include("test_tools.jl")

    @info("test_parameter_labels.jl")
    include("test_parameter_labels.jl")

    @info("test_parametertypes.jl")
    include("test_parametertypes.jl")

    @info("test_marginal_models.jl")
    include("test_marginal_models.jl")

    @info("test_adder.jl")
    include("test_adder.jl")

    @info("test_getindex.jl")
    include("test_getindex.jl")

    @info("test_num_components.jl")
    include("test_num_components.jl")

    @info("test_components_ordering.jl")
    include("test_components_ordering.jl")

    @info("test_variables_model_instance.jl")
    include("test_variables_model_instance.jl")

    @info("test_getdataframe.jl")
    include("test_getdataframe.jl")

    @info("test_mult_getdataframe.jl")        
    include("test_mult_getdataframe.jl")    

    @info("test_timesteparrays.jl")
    include("test_timesteparrays.jl")

    @info("test_timesteps.jl")           # fails currently
    include("test_timesteps.jl")

    @info("test_connectorcomp.jl")       # fails currently
    include("test_connectorcomp.jl")
end
