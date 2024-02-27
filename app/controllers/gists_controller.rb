class GistsController < ApplicationController
  before_action :set_test_passage, only: %i[create]
  before_action :set_question, only: %i[create]

  def create
    result = GistQuestionService.new(@question).call

    flash_options = if result
                      link = result.html_url
                      @gist = Gist.new(question_id: @question.id, user: current_user, url: link)

                      @gist.save ? { success: t('.success', link:) } : { danger: t('.failure') }
                    else
                      { danger: t('.failure') }
                    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end

  def set_question
    @question = Question.find(@test_passage.current_question_id)
  end
end
