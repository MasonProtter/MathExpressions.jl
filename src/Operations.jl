#---------------------------------------------------------------
#---------------------------------------------------------------
# AbstractOperations
#---------------------------------------------------------------
### All T where {T <: AbstractOperation} are assumed by default to have the fields:
###     op which describes the operation being performed
###     args::Vector which contains the operands
#---------------------------------------------------------------
function Base.:(==)(x::AbstractOperation,y::AbstractOperation)
    (x.op == y.op) && (length(x.args) == length(y.args)) && all(isequal.(x.args,y.args))
end

AbstractOperation()
#---------------------------------------------------------------
#---------------------------------------------------------------
# Operations
struct Operation <: AbstractOpation
    op::Atom
    args::Vector
end


#---------------------------------------------------------------
#---------------------------------------------------------------
# SymbolicOperations
struct SymbolicOperation <: AbstractOpation
    op::Atom
    args::Vector
end

