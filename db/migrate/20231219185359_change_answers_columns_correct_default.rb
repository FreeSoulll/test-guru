class ChangeAnswersColumnsCorrectDefault < ActiveRecord::Migration[6.1]
  def change
    change_table :answers do |t|
      t.change_default :correct, false
    end
  end
end
