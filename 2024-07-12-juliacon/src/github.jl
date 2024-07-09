using Kezdi

df = CSV.read("data/gh-list.csv", DataFrame)
df.Cpp = df.var"C++"
df.Csharp = df.var"C#"

dummies = @with df begin
    @replace Stata = (Stata > 0) 
    @replace MATLAB = (MATLAB > 0)  
    @replace R = (R > 0) 
    @replace Python = (Python > 0) 
    @replace Fortran = (Fortran > 0) 
    @replace C = (C + Cpp + Csharp > 0) 
    @replace Julia = (Julia > 0) 
    @keep Stata MATLAB R Python Fortran C Julia
    @generate n_lang = Stata + MATLAB + R + Python + Fortran + C + Julia
    @keep @if n_lang > 0
end

println("Number of languages used")
@with dummies begin
    @count
    @tabulate n_lang
end

marginals(df) = @with df begin
    @collapse Stata = sum(Stata) MATLAB = sum(MATLAB) R = sum(R) Python = sum(Python) Fortran = sum(Fortran) Julia = sum(Julia)
    @list
end

println("Which languages are used at least once?")
marginals(dummies)

println("Which are used alone?")
marginals(@with dummies @keep @if n_lang == 1)

# co-occurence of languages
println("Which are used together with Stata?")
marginals(@with dummies @keep @if Stata)

println("Which are used together with MATLAB?")
marginals(@with dummies @keep @if MATLAB)
    
println("Which are used together with Julia?")
marginals(@with dummies @keep @if Julia)