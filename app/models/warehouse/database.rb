module Warehouse::Database
  def self.included(base)
    config = YAML.load(ERB.new(File.read(File.dirname(__FILE__) + "/../../../config/database.yml")).result)
    base.send(:establish_connection, config["#{Rails.env}_warehouse_two"])
  end
end
