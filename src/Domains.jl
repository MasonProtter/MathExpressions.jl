Base.ndims(::AbstractDomain) = error("Domain dimension is undefined")

struct DiscreteDomain <: AbstractDomain
    length::Int
end

struct RealDomain <: AbstractDomain end
struct ComplexDomain <: AbstractDomain end
struct UnspecifiedDomain <: AbstractDomain end

struct Interval{T} <: AbstractDomain
  start::T
  stop::T
end

struct ProductDomain{T} <: AbstractDomain
    domains::T
end

Base.:*(x::AbstractDomain...) = ProductDomain((x...,))

export RealDomain, ComplexDomain, UnspecifiedDomain, DiscreteDomain, Interval, ProductDomain
