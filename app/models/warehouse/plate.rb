class Warehouse::Plate < ActiveRecord::Base
  include Warehouse::Database
  set_table_name "warehouse_two_#{Rails.env}.plates"
    
  def self.well_uuids_from_plate_barcodes(plate_barcodes_string)
    wells = []
    plate_barcodes_from_params(plate_barcodes_string) do |barcode|
      wells << Well.wells_from_stock_plate(plate_barcode)
    end
    
    wells.map(&:uuid)
  end
  
  def self.plate_barcodes_from_params(plate_barcodes_string)
    plate_barcodes_string.scan(/\d+/)
  end
  
  
end
