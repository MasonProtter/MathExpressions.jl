__precompile__()

module MathExpressions

import Lazy: @>
using DataStructures


"""

"""
abstract type Expression <: Number end


"""
Atoms are the not quite indivisible building blocks of mathematical expressions. The expression
    D(x, t) ≅ m * x(t)^2 + C
has atoms `D`, `x`, `t`, `≅`, `m`, `*` , `^`, `2`, `+` and `C`.

All `T` where `{T <: Atom}` are assumed by default to have the fields:

*) `name::Symbol` 

*) `value` which may contain a value associated with that atom or `nothing` otherwise
"""
abstract type Atom <: Expression end


abstract type AbstractOperation <: Expression end
abstract type AbstractDomain end
abstract type AbstractOperation <: Expression end

include("Domains.jl")
include("Atoms.jl")
include("Operations.jl")

export 

end
