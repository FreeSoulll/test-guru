class ChangeColumnTypeInAnswers < ActiveRecord::Migration[6.1]
  def change
    Answer.where(correct: 'true').update_all(correct: true)
    Answer.where(correct: 'false').update_all(correct: false) 

    change_column :answers, :correct, :boolean, using: 'correct::boolean', default: false
  end
end
