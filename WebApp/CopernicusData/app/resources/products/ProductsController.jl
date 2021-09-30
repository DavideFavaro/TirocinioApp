module ProductsController

using CSV, DataFrames, Genie, Genie.Renderer.Html, SearchLight, Stipple, StippleUI, StippleCharts, Products

sPage = ""

data = CSV.read("F:\\00_julia\\000_w\\11_davide\\git_clone_tirocionioapp\\TirocinioApp\\WebApp\\CopernicusData\\db\\seeds\\data.csv", DataFrame)#, limit=300 )

dfs = [ filter( row -> row.platformname == "Sentinel-$i", data ) for i in 1:3 ]

Base.@kwdef mutable struct ProductTable <: ReactiveModel
  s1_products::R{DataTable} = DataTable( dfs[1] )
  s2_products::R{DataTable} = DataTable( dfs[2] )
  s3_products::R{DataTable} = DataTable( dfs[3] )
  data_page::DataTablePagination = DataTablePagination(rows_per_page=33)
end

model = Stipple.init(ProductTable())

function ui()
  global model = Stipple.init(ProductTable())
  page(
    vm(ProductsController.model), class="container", [

      row([
        cell( class="st-module", [
          h3("Sentinel-1")
          Stipple.table( :s1_products; pagination=:data_page )
        ])
      ])

      row([
        cell( class="st-module", [
          h3("Sentinel-2")
          Stipple.table( :s2_products; pagination=:data_page )
        ])
      ])

      row([
        cell( class="st-module", [
          h3("Sentinel-3")
          Stipple.table( :s3_products; pagination=:data_page )
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
