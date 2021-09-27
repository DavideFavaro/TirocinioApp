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