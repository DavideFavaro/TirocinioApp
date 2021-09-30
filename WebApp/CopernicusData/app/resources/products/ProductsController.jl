module ProductsController

using Stipple, StippleUI, StippleCharts
using Genie, Genie.Renderer.Html, SearchLight, Products
using CSV, DataFrames

sPage = ""

# Read data from CSV
data = CSV.read( split( @__DIR__, "app" )[1] * "db\\seeds\\data.csv", DataFrame )

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

#Attributes tied to the creation of graphs
  features::R{ Vector{String} } = [
    "size",
    "productlevel",
    "instrumentname",
    "polarisationmode",
    "ingestiondate",
    "beginposition",
    "endposition",
    "creationdate",
    "generationdate",
    "illuminationzenithangle",
    "illuminationazimuthangle",
    "cloudcoverpercentage",
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


# Model initialization
model = Stipple.init(ProductTable())


# Events handling
on( model.sat_table ) do _
  # When "sat_table" value changes, find the index of the matching value in sats 
  index = findall( x -> x == model.sat_table[], sats )[1]
  # Change the table shown in the ui with the one of index "index" in the vector of tables
  model.products_table[] = DataTable( DataFrames.select( dfs[index], intersect( model.features[], names(dfs[index]) ) ) )
end


# Ui definition
function ui()
  global model = Stipple.init(ProductTable())
  page(
    vm(ProductsController.model), class="container", [
      heading("Copernicus Data")


      row([
        cell( class = "st-module", [
          h6("Satelite")
          Html.select( :sat_table, options=:satellites )
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
          h3("Sentinel data")
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
