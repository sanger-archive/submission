class Warehouse::Well < ActiveRecord::Base
  include Warehouse::Database 
  set_table_name "warehouse_two_#{Rails.env}.wells"
  set_primary_key :dont_use_id
  alias_attribute :id, :dont_use_id
  
  default_scope :conditions => { :is_current => true }
  
    
  def self.wells_from_stock_plate(plate_barcode)
    Well.where(:plate_barcode_prefix => "DN", :plate_barcode => plate_barcode)
  end
  
  
end
