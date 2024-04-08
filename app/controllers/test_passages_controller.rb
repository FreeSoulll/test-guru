class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result]

  def show
    return unless @test_passage.time_left <= 0

    redirect_to result_test_passage_path(@test_passage)
  end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.complited? || @test_passage.time_left <= 0
      @test_passage.set_success
      BadgeService.new(@test_passage).call if @test_passage.success?

      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def decode_time_to_minutes(time)
    time.to_i / 60_000.0
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
