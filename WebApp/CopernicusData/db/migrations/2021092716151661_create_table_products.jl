module CreateTableProducts

import SearchLight.Migrations: create_table, column, primary_key, add_index, drop_table

function up()
  create_table(:products) do
    [
      primary_key()
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
