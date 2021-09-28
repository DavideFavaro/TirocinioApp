module ProductsController
  
using Genie.Renderer.Html, SearchLight, Products

function index()
  html(:products, :index, products = rand(Product))
end

end
