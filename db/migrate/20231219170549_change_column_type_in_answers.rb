class ChangeColumnTypeInAnswers < ActiveRecord::Migration[6.1]
  def change
    cast_sql = 'CAST(correct AS boolean)'

    change_column :answers, :correct, default: false, using: cast_sql
  end
end
