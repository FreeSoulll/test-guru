class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[start]
  before_action :first_login, only: %i[index]

  def index
    @tests = Test.all
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def first_login
    if cookies[:first_reffer].blank? || cookies[:first_reffer] == false
      flash[:notice] = "Привет, #{current_user.first_name} #{current_user.last_name}!"
    end
    cookies[:first_reffer] = true
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
