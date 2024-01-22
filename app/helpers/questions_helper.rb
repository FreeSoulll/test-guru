module QuestionsHelper
  def question_header(question)
    return "Create New #{question.test.title} Question" unless question.persisted?

    "Update New #{question.test.title} Question"
  end
end
