class QuestionsController < ApplicationController
  before_action :find_test, only: %i[new create index]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    text = @test.questions.map { |question| "<p>#{question.body}</br></p>" }.join.html_safe

    render html: text
  end

  def show
    @question = Question.find(params[:id])
  end

  def new; end

  def create
    @test.questions.create(question_params)

    render plain: 'Вопрос был создан'
  end

  def destroy
    resource = Question.find(params[:id])
    resource.destroy

    render plain: 'Вопрос был удален'
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end
