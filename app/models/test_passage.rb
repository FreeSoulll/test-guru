class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :set_next_question

  PERCENT_SUCCESS = 85

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def complited?
    current_question.nil?
  end

  def set_success
    return unless success?

    self.success = true
    save!
  end

  def percentage_correct_answers
    correct_questions = self.correct_questions.to_f
    questions = self.test.questions.count.to_f

    (correct_questions / questions) * 100
  end

  def test_result
    return { status: 'not_complited' } unless success?

    { status: 'complited' }
  end

  def current_index
    test.questions.find_index(current_question) + 1
  end

  def success?
    percentage_correct_answers >= PERCENT_SUCCESS
  end

  def time_left(test_passage)
    test_passage.test.timer - ((Time.now - test_passage.created_at).to_i / 60.0) if test_passage.test&.timer&.positive?
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids&.map(&:to_i)&.sort
  end

  def correct_answers
    current_question.answers.corrects_answers
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first if current_question.present?
  end

  def set_next_question
    self.current_question = next_question
  end
end
