class Answer < ApplicationRecord
  belongs_to :question

  scope :corrects_answers, -> { where(correct: true) }

  validates :body, :correct, :question_id, presence: true
  validate :validate_number_answers

  private

  def validate_number_answers
    errors.add(:answers, 'Should have between 1-4 answers') if question.answers.count >= 4
  end
end
