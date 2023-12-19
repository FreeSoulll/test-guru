class AddTestsData < ActiveRecord::Migration[6.1]
  def change
    change_table :tests do |t|
      t.change_default :level, 1
    end
  end
end
