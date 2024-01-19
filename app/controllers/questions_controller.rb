class QuestionsController < ApplicationController
  before_action :find_test, only: %i[new create index]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    text = @test.questions.map { |question| "<p>#{question.body}</br></p>" }.join.html_safe

    render html: text
  end

  def show; end

  def new; end

  def create
    question = @test.questions.new(questions_params)
    if question.save
      render plain: 'Вопрос был создан'
    else
      render plain: 'Вопрос не  был создан'
    end
  end

  def destroy
    @question.destroy

    render plain: 'Вопрос был удален'
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

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
