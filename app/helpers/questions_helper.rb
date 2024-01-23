module QuestionsHelper
  def question_header(question)
    return "Update New #{question.test.title} Question" if question.persisted?

    "Create New #{question.test.title} Question"
  end
end
