module ProductsController

using Stipple, StippleUI, StippleCharts
using Genie, Genie.Renderer.Html, SearchLight, Products
using CSV, DataFrames

sPage = ""

# Read data from CSV
data = CSV.read( rsplit( @__DIR__, "app", limit=2 )[1] * "db\\seeds\\data.csv", DataFrame, limit=9000 )

# Divide the dataframe in subsets based on :platformname 
sats = unique(data[:, :platformname])
dfs = [ filter( row -> row.platformname == "$sat", data ) for sat in sats ]

# For each of the resulting dataframes remove empty columns (columns with only missing values)
for df in dfs
  nokeep = []
  for col in names(df)
    uniques = unique(df[:, col])
    if length( uniques ) == 1 && ismissing(uniques[1])
      push!( nokeep, col )
    end
  end
  DataFrames.select!( df, Not(nokeep) )
end


#Model definition
Base.@kwdef mutable struct ProductTable <: ReactiveModel

#Attributes tied to the creation of plot
  features::R{ Vector{String} } = [
    "platformname", #Per il testing
    "size", 
    "productlevel",
    "instrumentname",
    "creationdate",
    "cloudcoverpercentage"
    #=,
    "polarisationmode",
    "ingestiondate",
    "beginposition",
    "endposition",
    "generationdate",
    "illuminationzenithangle",
    "illuminationazimuthangle",
    "lrmpercentage",
    "openseapercentage",
    "landpercentage",
    "sarpercentage",
    "closedseapercentage",
    "continentalicepercentage",
    "vegetationpercentage",
    "notvegetatedpercentage",
    "highprobacloudspercentage",
    "mediumprobacloudspercentage",
    "waterpercentage",
    "snowicepercentage",
    "leapsecond",
    "leapSecondOccurrence"
    =#
  ]
  xfeature::R{String} = ""
  yfeature::R{String} = ""

# Attributes tied to the creation of a table
  # Table to be shown in the ui, its obtained selecting only the columns shared between "dfs" and "attrs"
  products_table::R{DataTable} = DataTable( DataFrames.select( dfs[1], intersect( features, names(dfs[1]) ) ) )
  data_page::DataTablePagination = DataTablePagination(rows_per_page=100)
  satellites::R{ Vector{String} } = sats
  sat_table::R{String} = sats[1]

end


#function rselect( fld, opts, model, attr, val  )
#  a = getproperty( model, fld )
#  println( "a: $a" )
#  Html.select( a, options=getproperty( model, opts ) )
#  b = getproperty( model, fld )
#  println( "b: $b" )
#  if b != a
#    println("A diverso da B")
#    index = findall( x -> x == getproperty( model, fld ), getproperty( model, opt ) )[1]
#    println( "index: $index" )
#    println( "dfs[$index][1:3]: $(val[index ][1:3])" )
#    newtable = DataTable( DataFrames.select( val[index], intersect( model.features[], names(val[index]) ) ) )
#    setproperty!( model, attr, newtable )
#  else
#    println()
#    println("ERRORE")
#    println()
#  end
#end


model = Stipple.init(ProductTable())




# Ui definition
function ui()
  global model = Stipple.init(ProductTable())


  # Events handling
  on( model.sat_table ) do _ 
    println( model.sat_table )
    # When "sat_table" value changes, find the index of the matching value in sats 
    index = findfirst( x -> x == model.sat_table[], sats )
    # Change the table shown in the ui with the one of index "index" in the vector of tables
    model.products_table[] = DataTable( DataFrames.select( dfs[index], intersect( model.features[], names(dfs[index]) ) ) )
  end


  page(
    vm(ProductsController.model), class="container", [
      heading("Copernicus Data")


      row([
        cell( class = "st-module", [
          h6("Satelite")
          Html.select( @data(:sat_table), options=:satellites )
        ])

        cell( class = "st-module", [
          h6("X Axis")
          Html.select( :xfeature, options=:features )
        ])

        cell( class = "st-module", [
          h6("Y Axis")
          Html.select( :yfeature, options=:features )
        ])
      ])


      row([
        cell( class = "st-module", [
          h6("Sentinel data")
          Stipple.table( :products_table; pagination=:data_page )
        ])
      ])
    ]
  )
end



function s_index()
  global sPage = ui()
  html( :products, :s_index, oCtrl=ProductsController )
end



function index()
  html( :products, :index, products = rand(Product) )
end



end # module
