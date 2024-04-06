class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result]
  after_action :set_cookie_first_time, only: %i[show]

  def show
    set_timer_cookie(params)
  end

  def result
    cookies.delete :timer if cookies[:timer]
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    set_timer_cookie(params) if params[:timer].present?

    if @test_passage.complited?
      @test_passage.set_success
      BadgeService.new(@test_passage).call if @test_passage.success?

      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_cookie_first_time
    cookies[:timer] ||= @test_passage.test.timer
  end

  def set_timer_cookie(params)
    return unless params.key?(:timer)

    timer_value = decode_time_to_minutes(params[:timer])
    cookies[:timer] = timer_value if timer_value.present?
  end

  def decode_time_to_minutes(time)
    time.to_i / 60_000.0
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
