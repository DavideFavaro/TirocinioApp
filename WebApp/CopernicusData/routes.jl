using Genie.Router
using ProductsController

route( "/products", ProductsController.index )

route( "/Sproducts", ProductsController.s_index )

route("/") do
  serve_static_file("welcome.html")
end