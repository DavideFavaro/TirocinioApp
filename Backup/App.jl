module App

using Revise

#=


cd("WebApp")
]activate .
using Genie
Genie.newapp_mvc("CopernicusData")

* MODIFY db/connections.yaml

include(joinpath("config", "initializers", "searchlight.jl"))
Genie.newresource("product")

* MODIFY db/migrations/..._create_table_"name".jl WITH 1

SearchLight.Migration.create_migrations_table()
SearchLight.Migration.status()
SearchLight.Migration.last_up()

* MODIFY app/resources/"name"s/"Name"s.jl WITH 2
    TEST using "Name"s
         var = "Name"()

* MOVE THE CSV IN db/seeds

touch(joinpath("db", "seeds", "seed_products.jl"))

* MODIFY db/seeds/seed_"name"s.jl WITH 3

]add CSV
include(joinpath("db", "seeds", "seed_products.jl"))
seed()


=#




#= 1
column( :type, :string )
      column( :uuid, :string )
      column( :relpassnumber, :integer ) #Nullable
      column( :relpassdirection, :string ) #Nullable
      column( :filename, :string )
      column( :instrumentname, :string )
      column( :timeliness, :string ) #Nullable
      column( :footprint, :string )
      column( :size, :string )
      column( :productlevel, :string ) #Nullable
      column( :relorbitdir, :string ) #Nullable
      column( :ingestiondate, :string )
      column( :ecmwf, :string ) #Nullable
      column( :sensoroperationalmode, :string ) #Nullable
      column( :beginposition, :string )
      column( :procfacilityname, :string ) #Nullable
      column( :orbitnumber, :integer )
      column( :mode, :string ) #Nullable
      column( :platformname, :string )
      column( :producttype, :string )
      column( :orbitdirection, :string )
      column( :format, :string )
      column( :passdirection, :string ) #Nullable
      column( :procfacilityorg, :string ) #Nullable
      column( :relativeorbitnumber, :integer )
      column( :pduduration, :integer ) #Nullable
      column( :platformidentifier, :string )
      column( :gmlfootprint, :string )
      column( :endposition, :string )
      column( :creationdate, :string ) #Nullable
      column( :onlinequalitycheck, :string )
      column( :processingname, :string ) #Nullable
      column( :identifier, :string )
      column( :passnumber, :integer ) #Nullable
      column( :pdualongtrackcoord, :integer ) #Nullable
      column( :instrumentshortname, :string )
      column( :processinglevel, :string ) #Nullable
      column( :cloudcoverpercentage, :float ) #Nullable
      column( :lrmpercentage, :integer ) #Nullable
      column( :openseapercentage, :integer ) #Nullable
      column( :landpercentage, :integer ) #Nullable
      column( :sarpercentage, :integer ) #Nullable
      column( :closedseapercentage, :integer ) #Nullable
      column( :continentalicepercentage, :integer ) #Nullable
      column( :nbfire, :integer ) #Nullable
      column( :lastpassdirection, :string ) #Nullable
      column( :lastrelpassnumber, :integer ) #Nullable
      column( :lastrelorbitdirection, :string ) #Nullable
      column( :lastorbitdirection, :string ) #Nullable
      column( :lastrelativeorbitnumber, :integer ) #Nullable
      column( :lastpassnumber, :integer ) #Nullable
      column( :lastrelpassdirection, :string ) #Nullable
      column( :lastorbitnumber, :integer ) #Nullable
      column( :pdutileid, :string ) #Nullable
      column( :productclass, :string ) #Nullable
      column( :polarisationmode, :string ) #Nullable
      column( :status, :string ) #Nullable
      column( :slicenumber, :integer ) #Nullable
      column( :missiondatatakeid, :integer ) #Nullable
      column( :swathidentifier, :string ) #Nullable
      column( :acquisitiontype, :string ) #Nullable
      column( :productconsolidation, :string ) #Nullable
      column( :unclassifiedpercentage, :float ) #Nullable
      column( :s2datatakeid, :string ) #Nullable
      column( :granuleidentifier, :string ) #Nullable
      column( :level1cpdiidentifier, :string ) #Nullable
      column( :vegetationpercentage, :float ) #Nullable
      column( :notvegetatedpercentage, :float ) #Nullable
      column( :processingbaseline, :float ) #Nullable
      column( :mediumprobacloudspercentage, :float ) #Nullable
      column( :datastripidentifier, :string ) #Nullable
      column( :generationdate, :string ) #Nullable
      column( :illuminationzenithangle, :float ) #Nullable
      column( :platformserialidentifier, :string ) #Nullable
      column( :waterpercentage, :float ) #Nullable
      column( :highprobacloudspercentage, :float ) #Nullable
      column( :illuminationazimuthangle, :float ) #Nullable
      column( :snowicepercentage, :float ) #Nullable
      column( :hv_order_tileid, :string ) #Nullable
      column( :tileid, :string ) #Nullable
      column( :datatakesensingstart, :string ) #Nullable
      column( :leapsecond, :integer ) #Nullable
      column( :leapSecondOccurrence, :string ) #Nullable

  add_index(:products, :uuid)
  add_index(:products, :filename)
  add_index(:products, :platformname)
  add_index(:products, :producttype)
=#



#= 2
type::String = "Product"
  uuid::String = ""
  relpassnumber::Int = 0 #Nullable
  relpassdirection::String = "" #Nullable
  filename::String = ""
  instrumentname::String = ""
  timeliness::String = "" #Nullable
  footprint::String = ""
  size::String = ""
  productlevel::String = "" #Nullable
  relorbitdir::String = "" #Nullable
  ingestiondate::String = ""
  ecmwf::String = "" #Nullable
  sensoroperationalmode::String = "" #Nullable
  beginposition::String = ""
  procfacilityname::String = "" #Nullable
  orbitnumber::Int = 0
  mode::String = "" #Nullable
  platformname::String = ""
  producttype::String = ""
  orbitdirection::String = ""
  format::String = ""
  passdirection::String = "" #Nullable
  procfacilityorg::String = "" #Nullable
  relativeorbitnumber::Int = 0
  pduduration::Int = 0 #Nullable
  platformidentifier::String = ""
  gmlfootprint::String = ""
  endposition::String = ""
  creationdate::String = "" #Nullable
  onlinequalitycheck::String = ""
  processingname::String = "" #Nullable
  identifier::String = ""
  passnumber::Int = 0 #Nullable
  pdualongtrackcoord::Int = 0 #Nullable
  instrumentshortname::String = ""
  processinglevel::String = "" #Nullable
  cloudcoverpercentage::Real = 0.0 #Nullable
  lrmpercentage::Int = 0 #Nullable
  openseapercentage::Int = 0 #Nullable
  landpercentage::Int = 0 #Nullable
  sarpercentage::Int = 0 #Nullable
  closedseapercentage::Int = 0 #Nullable
  continentalicepercentage::Int = 0 #Nullable
  nbfire::Int = 0 #Nullable
  lastpassdirection::String = "" #Nullable
  lastrelpassnumber::Int = 0 #Nullable
  lastrelorbitdirection::String = "" #Nullable
  lastorbitdirection::String = "" #Nullable
  lastrelativeorbitnumber::Int = 0 #Nullable
  lastpassnumber::Int = 0 #Nullable
  lastrelpassdirection::String = "" #Nullable
  lastorbitnumber::Int = 0 #Nullable
  pdutileid::String = "" #Nullable
  productclass::String = "" #Nullable
  polarisationmode::String = "" #Nullable
  status::String = "" #Nullable
  slicenumber::Int = 0 #Nullable
  missiondatatakeid::Int = 0 #Nullable
  swathidentifier::String = "" #Nullable
  acquisitiontype::String = "" #Nullable
  productconsolidation::String = "" #Nullable
  unclassifiedpercentage::Real = 0.0 #Nullable
  s2datatakeid::String = "" #Nullable
  granuleidentifier::String = "" #Nullable
  level1cpdiidentifier::String = "" #Nullable
  vegetationpercentage::Real = 0.0 #Nullable
  notvegetatedpercentage::Real = 0.0 #Nullable
  processingbaseline::Real = 0.0 #Nullable
  mediumprobacloudspercentage::Real = 0.0 #Nullable
  datastripidentifier::String = "" #Nullable
  generationdate::String = "" #Nullable
  illuminationzenithangle::Real = 0.0 #Nullable
  platformserialidentifier::String = "" #Nullable
  waterpercentage::Real = 0.0 #Nullable
  highprobacloudspercentage::Real = 0.0 #Nullable
  illuminationazimuthangle::Real = 0.0 #Nullable
  snowicepercentage::Real = 0.0 #Nullable
  hv_order_tileid::String = "" #Nullable
  tileid::String = "" #Nullable
  datatakesensingstart::String = "" #Nullable
  leapsecond::Int = 0 #Nullable
  leapSecondOccurrence::String = "" #Nullable
=#



#=
using SearchLight, Products
using CSV

Base.convert(::Type{String}, _::Missing) = ""
Base.convert(::Type{Int}, _::Missing) = 0
Base.convert(::Type{Real}, _::Missing) = 0.0
Base.convert(::Type{Int}, s::String) = parse(Int, s)
Base.convert(::Type{Real}, s::String) = parse(Real, s)

function seed()
  for row in CSV.Rows(joinpath(@__DIR__, "data.csv"), limit = 1_000)
    p = Product()

    p.type = row.type
    p.uuid = row.uuid
    p.relpassnumber = row.relpassnumber
    p.relpassdirection = row.relpassdirection
    p.filename = row.filename
    p.instrumentname = row.instrumentname
    p.timeliness = row.timeliness
    p.footprint = row.footprint
    p.size = row.size
    p.productlevel = row.productlevel
    p.relorbitdir = row.relorbitdir
    p.ingestiondate = row.ingestiondate
    p.ecmwf = row.ecmwf
    p.sensoroperationalmode = row.sensoroperationalmode
    p.beginposition = row.beginposition
    p.procfacilityname = row.procfacilityname
    p.orbitnumber = row.orbitnumber
    p.mode = row.mode
    p.platformname = row.platformname
    p.producttype = row.producttype
    p.orbitdirection = row.orbitdirection
    p.format = row.format
    p.passdirection = row.passdirection
    p.procfacilityorg = row.procfacilityorg
    p.relativeorbitnumber = row.relativeorbitnumber 
    p.pduduration = row.pduduration
    p.platformidentifier = row.platformidentifier
    p.gmlfootprint = row.gmlfootprint
    p.endposition = row.endposition
    p.creationdate = row.creationdate
    p.onlinequalitycheck = row.onlinequalitycheck
    p.processingname = row.processingname
    p.identifier = row.identifier
    p.passnumber = row.passnumber
    p.pdualongtrackcoord = row.pdualongtrackcoord
    p.instrumentshortname = row.instrumentshortname
    p.processinglevel = row.processinglevel
    p.cloudcoverpercentage = row.cloudcoverpercentage
    p.lrmpercentage = row.lrmpercentage
    p.openseapercentage = row.openseapercentage
    p.landpercentage = row.landpercentage
    p.sarpercentage = row.sarpercentage
    p.closedseapercentage = row.closedseapercentage
    p.continentalicepercentage = row.continentalicepercentage
    p.nbfire = row.nbfire
    p.lastpassdirection = row.lastpassdirection
    p.lastrelpassnumber = row.lastrelpassnumber
    p.lastrelorbitdirection = row.lastrelorbitdirection
    p.lastorbitdirection = row.lastorbitdirection
    p.lastrelativeorbitnumber = row.lastrelativeorbitnumber
    p.lastpassnumber = row.lastpassnumber
    p.lastrelpassdirection = row.lastrelpassdirection
    p.lastorbitnumber = row.lastorbitnumber
    p.pdutileid = row.pdutileid
    p.productclass = row.productclass
    p.polarisationmode = row.polarisationmode
    p.status = row.status
    p.slicenumber = row.slicenumber
    p.missiondatatakeid = row.missiondatatakeid
    p.swathidentifier = row.swathidentifier
    p.acquisitiontype = row.acquisitiontype
    p.productconsolidation = row.productconsolidation
    p.unclassifiedpercentage = row.unclassifiedpercentage
    p.s2datatakeid = row.s2datatakeid
    p.granuleidentifier = row.granuleidentifier
    p.level1cpdiidentifier = row.level1cpdiidentifier
    p.vegetationpercentage = row.vegetationpercentage
    p.notvegetatedpercentage = row.notvegetatedpercentage
    p.processingbaseline = row.processingbaseline
    p.mediumprobacloudspercentage = row.mediumprobacloudspercentage
    p.datastripidentifier = row.datastripidentifier
    p.generationdate = row.generationdate
    p.illuminationzenithangle = row.illuminationzenithangle
    p.platformserialidentifier = row.platformserialidentifier
    p.waterpercentage = row.waterpercentage
    p.highprobacloudspercentage = row.highprobacloudspercentage
    p.illuminationazimuthangle = row.illuminationazimuthangle
    p.snowicepercentage = row.snowicepercentage
    p.hv_order_tileid = row.hv_order_tileid
    p.tileid = row.tileid
    p.datatakesensingstart = row.datatakesensingstart
    p.leapsecond = row.leapsecond
    p.leapSecondOccurrence = row.leapSecondOccurrence

    save(p)
  end
end
=#



end # module