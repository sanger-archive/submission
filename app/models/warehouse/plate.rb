class Warehouse::Plate < ActiveRecord::Base
  include Warehouse::Database
  set_table_name "warehouse_two_#{Rails.env}.plates"
    
  def self.well_uuids_from_plate_barcodes(plate_barcodes_string)
    wells = []
    plate_barcodes_from_params(plate_barcodes_string).each do |barcode|
      wells << Warehouse::Well.wells_from_stock_plate(barcode)
    end

    wells.flatten.map(&:uuid)
  end
  
  def self.plate_barcodes_from_params(plate_barcodes_string)
    plate_barcodes_string.scan(/\d+/)
  end
  
  def self.find_studies_to_well_uuids_from_barcodes(plate_barcodes_string)
    studies_to_wells = {}
    # Todo load all plates at once plus egar load wells
    plate_barcodes_from_params(plate_barcodes_string).each do |barcode|
      plate = stock_plate(barcode)
      requests = Warehouse::Request.where( :source_asset_uuid => plate.uuid )
      if requests.first && requests.first.study_uuid
        if studies_to_wells[requests.first.study_uuid]
          studies_to_wells[requests.first.study_uuid] = studies_to_wells[requests.first.study_uuid] + Warehouse::Well.well_uuids_from_stock_plate(barcode)
        else
          studies_to_wells[requests.first.study_uuid] = Warehouse::Well.well_uuids_from_stock_plate(barcode)
        end

      end
    end
    
    studies_to_wells
  end
  
  def self.stock_plate(barcode)
    where(:barcode_prefix => "DN", :barcode => barcode).first
  end
  
end
