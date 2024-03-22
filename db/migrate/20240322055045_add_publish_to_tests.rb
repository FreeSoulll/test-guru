class AddPublishToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :publish, :boolean, null: false, default: false
  end
end
