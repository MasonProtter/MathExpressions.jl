#---------------------------------------------------------------
#---------------------------------------------------------------
# Atoms
function Base.show(io::IO, x::Atom)
    if x.value == nothing
        print(io, x.name)
    else
        print(io, x.value)
    end
end

function Base.:(==)(x::Atom, y::Atom)
    (typeof(x) == typeof(y)) && (x.name == y.name) && (x.value == y.value)
end

Base.:(==)(x::Atom, y) = y != nothing && x.value == y
Base.:(==)(x, y::Atom) = x != nothing && y.value == x

Base.Symbol(s::Atom) = s.name

Atom(name::Symbol;
         value = nothing,
         description::String = "",
         domain = UnspecifiedDomain()) = Variable(name, value, description, domain)

#---------------------------------------------------------------
#---------------------------------------------------------------
# Variables
struct Variable <: Atom
    name::Symbol
    value
    description::String
    domain::AbstractDomain
end

Variable(name::Symbol;
         value = nothing,
         description::String = "",
         domain = UnspecifiedDomain()) = Variable(name, value, description, domain)

macro defvariables(names...)
    out = Expr(:block)
    for name in names
        v = Variable(name)
        push!(out.args, Expr(:(=), name, v))
    end
   esc(out)
end

(f::Variable)(t) = Expression(f, [t])

#---------------------------------------------------------------
#---------------------------------------------------------------
# Constants
    
struct Constant <: Atom
    name::Symbol
    value
    description::String
    domain::AbstractDomain
end

Constant(name::Symbol;
         value = nothing,
         description::String = "",
         domain = UnspecifiedDomain()) = Constant(name, value, description, domain)

macro defconstants(names...)
    out = Expr(:block)
    for name in names
        v = Constant(name)
        push!(out.args, Expr(:(=), name, v))
    end
   esc(out)
end

#---------------------------------------------------------------
#---------------------------------------------------------------
# Parameters

struct Parameter <: Atom
    name::Symbol
    value
    description::String
    domain::AbstractDomain
end

Parameter(name::Symbol;
          value = nothing,
          description::String = "",
          domain = UnspecifiedDomain()) = Parameter(name, value, description, domain)


macro defparameters(names...)
    out = Expr(:block)
    for name in names
        v = Parameter(name)
        push!(out.args, Expr(:(=), name, v))
    end
   esc(out)
end

