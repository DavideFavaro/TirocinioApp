module CreateTableProducts

import SearchLight.Migrations: create_table, column, primary_key, add_index, drop_table

function up()
  create_table(:products) do
    [
      primary_key()
      column( :uuid, :string, limit = 100 )
      column( :relpassnumber, :integer, limit = 100 ) #Nullable
      column( :relpassdirection, :string, limit = 1000 ) #Nullable
      column( :filename, :string, limit = 300 )
      column( :instrumentname, :string, limit = 300 )
      column( :timeliness, :string, limit = 100 ) #Nullable
      column( :footprint, :string, limit = 3_000 )
      column( :size, :string, limit = 100 )
      column( :productlevel, :string, limit = 100 ) #Nullable
      column( :relorbitdir, :string, limit = 100 ) #Nullable
      column( :ingestiondate, :string, limit = 100 )
      column( :ecmwf, :string, limit = 100 ) #Nullable
      column( :sensoroperationalmode, :string, limit = 100 ) #Nullable
      column( :beginposition, :string, limit = 100 )
      column( :procfacilityname, :string, limit = 100 ) #Nullable
      column( :orbitnumber, :integer, limit = 100 )
      column( :mode, :string, limit = 100 ) #Nullable
      column( :platformname, :string, limit = 300 )
      column( :producttype, :string, limit = 100 )
      column( :orbitdirection, :string, limit = 100 )
      column( :format, :string, limit = 100 )
      column( :passdirection, :string, limit = 100 ) #Nullable
      column( :procfacilityorg, :string, limit = 100 ) #Nullable
      column( :relativeorbitnumber, :integer, limit = 100 )
      column( :pduduration, :integer, limit = 100 ) #Nullable
      column( :platformidentifier, :string, limit = 100 )
      column( :gmlfootprint, :string, limit = 3_000 )
      column( :endposition, :string, limit = 100 )
      column( :creationdate, :string, limit = 100 ) #Nullable
      column( :onlinequalitycheck, :string, limit = 100 )
      column( :processingname, :string, limit = 300 ) #Nullable
      column( :identifier, :string, limit = 300 )
      column( :passnumber, :integer, limit = 100 ) #Nullable
      column( :pdualongtrackcoord, :integer, limit = 3_000 ) #Nullable
      column( :instrumentshortname, :string, limit = 100 )
      column( :processinglevel, :string, limit = 100 ) #Nullable
      column( :cloudcoverpercentage, :float, limit = 100 ) #Nullable
      column( :lrmpercentage, :integer, limit = 100 ) #Nullable
      column( :openseapercentage, :integer, limit = 100 ) #Nullable
      column( :landpercentage, :integer, limit = 100 ) #Nullable
      column( :sarpercentage, :integer, limit = 100 ) #Nullable
      column( :closedseapercentage, :integer, limit = 100 ) #Nullable
      column( :continentalicepercentage, :integer, limit = 100 ) #Nullable
      column( :nbfire, :integer, limit = 100 ) #Nullable
      column( :lastpassdirection, :string, limit = 100 ) #Nullable
      column( :lastrelpassnumber, :integer, limit = 100 ) #Nullable
      column( :lastrelorbitdirection, :string, limit = 100 ) #Nullable
      column( :lastorbitdirection, :string, limit = 100 ) #Nullable
      column( :lastrelativeorbitnumber, :integer, limit = 100 ) #Nullable
      column( :lastpassnumber, :integer, limit = 100 ) #Nullable
      column( :lastrelpassdirection, :string, limit = 100 ) #Nullable
      column( :lastorbitnumber, :integer, limit = 100 ) #Nullable
      column( :pdutileid, :string, limit = 3_000 ) #Nullable
      column( :productclass, :string, limit = 300 ) #Nullable
      column( :polarisationmode, :string, limit = 100 ) #Nullable
      column( :status, :string, limit = 300 ) #Nullable
      column( :slicenumber, :integer, limit = 100 ) #Nullable
      column( :missiondatatakeid, :integer, limit = 300 ) #Nullable
      column( :swathidentifier, :string, limit = 300 ) #Nullable
      column( :acquisitiontype, :string, limit = 100 ) #Nullable
      column( :productconsolidation, :string, limit = 100 ) #Nullable
      column( :unclassifiedpercentage, :float, limit = 100 ) #Nullable
      column( :s2datatakeid, :string, limit = 300 ) #Nullable
      column( :granuleidentifier, :string, limit = 300 ) #Nullable
      column( :level1cpdiidentifier, :string, limit = 300 ) #Nullable
      column( :vegetationpercentage, :float, limit = 100 ) #Nullable
      column( :notvegetatedpercentage, :float, limit = 100 ) #Nullable
      column( :processingbaseline, :float, limit = 100 ) #Nullable
      column( :mediumprobacloudspercentage, :float, limit = 100 ) #Nullable
      column( :datastripidentifier, :string, limit = 300 ) #Nullable
      column( :generationdate, :string, limit = 100 ) #Nullable
      column( :illuminationzenithangle, :float, limit = 100 ) #Nullable
      column( :platformserialidentifier, :string, limit = 300 ) #Nullable
      column( :waterpercentage, :float, limit = 100 ) #Nullable
      column( :highprobacloudspercentage, :float, limit = 100 ) #Nullable
      column( :illuminationazimuthangle, :float, limit = 100 ) #Nullable
      column( :snowicepercentage, :float, limit = 100 ) #Nullable
      column( :hv_order_tileid, :string, limit = 300 ) #Nullable
      column( :tileid, :string, limit = 300 ) #Nullable
      column( :datatakesensingstart, :string, limit = 100 ) #Nullable
      column( :leapsecond, :integer, limit = 100 ) #Nullable
      column( :leapSecondOccurrence, :string, limit = 100 ) #Nullable
    ]
  end

  add_index(:products, :uuid)
  add_index(:products, :filename)
  add_index(:products, :platformname)
  add_index(:products, :producttype)
end

function down()
  drop_table(:products)
end

end
