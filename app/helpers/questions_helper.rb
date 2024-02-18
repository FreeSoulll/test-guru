module QuestionsHelper
  def question_header(question)
    return t('questions.question_header_update', title: question.test.title) if question.persisted?

    t('questions.question_header_create', title: question.test.title)
  end
end
