using Genie.Router
using Genie.Assets
using ProductsController

#route( "/products", ProductsController.index )

route( "/", ProductsController.index ) 

#route("/") do
#  serve_static_file("welcome.html")
#end