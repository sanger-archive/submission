class Warehouse::Well < ActiveRecord::Base
  include Warehouse::Database 
  set_table_name "warehouse_two_#{Rails.env}.wells"
    
  def self.wells_from_stock_plate(plate_barcode)
    Warehouse::Well.where(:plate_barcode_prefix => "DN", :plate_barcode => plate_barcode)
  end
  
  def self.well_uuids_from_stock_plate(plate_barcode)
    wells_from_stock_plate(plate_barcode).flatten.map(&:uuid)
  end
  
  
end
