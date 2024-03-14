class ChangeColumnTypeInAnswers < ActiveRecord::Migration[6.1]
  def change
    change_column :answers, :correct, :boolean, default: false
  end
end
