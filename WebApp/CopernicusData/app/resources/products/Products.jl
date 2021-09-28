module Products

import SearchLight: AbstractModel, DbId
import Base: @kwdef

export Product

@kwdef mutable struct Product <: AbstractModel
  id::DbId = DbId()
  uuid::String = ""
  relpassnumber::String = "" #Nullable
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
  cloudcoverpercentage::Float64 = 0.0 #Nullable
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
  unclassifiedpercentage::Float64 = 0.0 #Nullable
  s2datatakeid::String = "" #Nullable
  granuleidentifier::String = "" #Nullable
  level1cpdiidentifier::String = "" #Nullable
  vegetationpercentage::Float64 = 0.0 #Nullable
  notvegetatedpercentage::Float64 = 0.0 #Nullable
  processingbaseline::Float64 = 0.0 #Nullable
  mediumprobacloudspercentage::Float64 = 0.0 #Nullable
  datastripidentifier::String = "" #Nullable
  generationdate::String = "" #Nullable
  illuminationzenithangle::Float64 = 0.0 #Nullable
  platformserialidentifier::String = "" #Nullable
  waterpercentage::Float64 = 0.0 #Nullable
  highprobacloudspercentage::Float64 = 0.0 #Nullable
  illuminationazimuthangle::Float64 = 0.0 #Nullable
  snowicepercentage::Float64 = 0.0 #Nullable
  hv_order_tileid::String = "" #Nullable
  tileid::String = "" #Nullable
  datatakesensingstart::String = "" #Nullable
  leapsecond::Int = 0 #Nullable
  leapSecondOccurrence::String = "" #Nullable
end

end
