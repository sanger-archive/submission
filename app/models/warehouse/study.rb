class Warehouse::Study < ActiveRecord::Base
  include Warehouse::Database 
  set_table_name "warehouse_two_#{Rails.env}.studies"
end
