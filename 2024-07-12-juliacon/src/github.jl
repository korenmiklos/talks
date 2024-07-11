using Kezdi, Plots

# define functions
marginals(df) = @with df begin
    @collapse Stata = sum(Stata) MATLAB = sum(MATLAB) R = sum(R) Python = sum(Python) Fortran = sum(Fortran) C = sum(C) Julia = sum(Julia)
    @list
end

horizontal(df) = bar(names(df), collect(df[1, :]), permute=(:x, :y), legend=false, ylabel="Count", title="Usage of programming languages")

# init
gr()
plot_font = "Px Grotesk"
default(fontfamily=plot_font,
        linewidth=2, framestyle=:box, label=nothing, grid=false)
# read data
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

println("Which languages are used at least once?")
m = marginals(dummies)
p = horizontal(m)
savefig(p, "figures/languages.pdf")

println("Which are used alone?")
marginals(@with dummies @keep @if n_lang == 1)

# co-occurence of languages
println("Which are used together with Stata?")
marginals(@with dummies @keep @if Stata)

println("Which are used together with MATLAB?")
marginals(@with dummies @keep @if MATLAB)
    
println("Which are used together with Julia?")
marginals(@with dummies @keep @if Julia)