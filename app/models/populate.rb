class Populate
  def parse_models(api)
    %w[ Project Study SubmissionTemplate].each do |class_name|
      populate_table(api,class_name)
    end
  end
  
  def populate_table(api,class_name)
    if class_name.constantize.count == 0
      api.send(:"#{class_name.tableize.singularize}").all.each do |object|
        class_name.constantize.create!(:name => object.name, :uuid => object.uuid)
      end
    end
  end
  
  
end