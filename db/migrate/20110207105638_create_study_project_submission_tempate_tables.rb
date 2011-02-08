class CreateStudyProjectSubmissionTempateTables < ActiveRecord::Migration
  def self.up
    create_table :studies, :force => true do |t|
      t.string :uuid
      t.string :name
      t.timestamps
    end
    add_index :studies, :uuid
    add_index :studies, :name
    
    create_table :projects, :force => true do |t|
      t.string :uuid
      t.string :name
      t.timestamps
    end
    add_index :projects, :uuid
    add_index :projects, :name
    
    create_table :submission_templates, :force => true do |t|
      t.string :uuid
      t.string :name
      t.timestamps
    end
    add_index :submission_templates, :uuid
    add_index :submission_templates, :name
  end

  def self.down
    drop_table :submission_templates
    drop_table :projects
    drop_table :studies
  end
end