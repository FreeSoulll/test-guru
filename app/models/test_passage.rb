class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :set_next_question

  PERCENT_SUCCESS = 85

  def giving_badges
    [all_tests_backend, all_tests_from_level, test_passed_from_first_time].reject(&:!)
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def complited?
    current_question.nil?
  end

  def percentage_correct_answers
    correct_questions = self.correct_questions.to_f
    questions = self.test.questions.count.to_f

    (correct_questions / questions) * 100
  end

  def test_result
    return { status: 'not_complited' } if percentage_correct_answers < PERCENT_SUCCESS

    { status: 'complited' }
  end

  def current_index
    test.questions.find_index(current_question) + 1
  end

  private

  def check_tests(tests, category = nil)
    return false if tests.count == 0

    passed_tests = user.tests
    last_record = user.tests.last
    all_tests_passed = tests.all? { |test| passed_tests.include?(test) }

    if all_tests_passed && passed_tests.records.count(last_record) <= 1 && percentage_correct_answers >= PERCENT_SUCCESS
      return category ? category : true
    end

    false
  end

  def all_tests_backend
    backend_tests = Test.joins(:category).where(categories: { title: 'Backend' })
    check_tests(backend_tests, 'category_backend')
  end

  def all_tests_from_level
    tests = Test.where(level: 4, publish: true)
    check_tests(tests, 'test_from_four_level')
  end

  def test_passed_from_first_time
    check_tests(user.tests, 'test_from_first_try')
  end

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
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def set_next_question
    self.current_question = next_question
  end
end
