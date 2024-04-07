class AddTimeLeftToTestPassages < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :time_left, :decimal
  end
end
