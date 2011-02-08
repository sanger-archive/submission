class CreateLocalSubmissionsTable < ActiveRecord::Migration
  def self.up
    create_table :local_submissions, :force => true do |t|
      t.string :uuid
      t.timestamps
    end
    add_index :local_submissions, :uuid
  end

  def self.down
    drop_table :local_submissions
  end
end