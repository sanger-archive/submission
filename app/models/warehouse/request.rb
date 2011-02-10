class Warehouse::Request < ActiveRecord::Base
  include Warehouse::Database 
  set_table_name "warehouse_two_#{Rails.env}.requests"
end
