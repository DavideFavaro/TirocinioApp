module ProductsController

using CSV, DataFrames, Genie, Genie.Renderer.Html, SearchLight, Stipple, StippleUI, StippleCharts, Products

sPage = ""
data = CSV.read("D:\\Documents and Settings\\DAVIDE-FAVARO\\My Documents\\GitHub\\TirocinioApp\\WebApp\\CopernicusData\\db\\seeds\\data.csv", DataFrame )
Base.@kwdef mutable struct ProductArray <: ReactiveModel
  products::R{DataTable} = DataTable(data)
  data_page::DataTablePagination = DataTablePagination(rows_per_page=100)
end

model = Stipple.init(ProductArray())

function ui()
  global model = Stipple.init(ProductArray())
  page(
    vm(ProductsController.model), class="container", [
        Stipple.table( :products; pagination=:data_page )
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
