module Ariel

export read_QuestaalXYZ

println("Ariel.jl")
println("Of sulphurous roaring the most mighty Neptune")
println("Seem to besiege and make his bold waves tremble,")

"""
 read_QuestaalXYZ(f::IOStream)
 
 Read in Questaal .XYZ file format to a trajectory object.

XYZ format looks like (128 H2O):
384 PLAT:   29.73674  0  0  0  29.73674  0  0  0  29.73674
t=103460fs T=285K V=-113.146Ry K.E.+V=-112.1104Ry alat=1; velocities times 1000
O            2.69595    -2.92790    13.17485    0.54262  -0.46064  -0.19684    0.00826   0.03806  -0.06875    1.01293   0.03968   0.25365  -0.09923   0.00000   0.00000   0.00000   0.00000   0.00000
"""
function read_QuestaalXYZ(f::IOStream)
    h=split(readline(f))
    natoms=parse(Int,h[1])
    println("natoms: $natoms")
    
    PLAT=reshape(map(x->parse(Float64,x), h[3:11] ), 3,3) # lattice parameters
    show(PLAT)

    readline(f) # don't do anything with the comment line, currently

#    traj=[]
#    while !eof(f)
#        append(traj,read_next_frame(f),natoms)
#    end
    A=reshape(readdlm(f, skipstart=2), natoms, 19, 2)
    show(A)
end

"Gobble natoms worth of frame"
function read_next_frame(f::IOStream,natoms)
    println("Oh lordy.")        
end

end # module
