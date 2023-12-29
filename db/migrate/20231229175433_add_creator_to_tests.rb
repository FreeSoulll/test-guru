class AddCreatorToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :creator_id, :integer
    add_index :tests, :creator_id
  end
end
