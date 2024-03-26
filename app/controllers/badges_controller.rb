class BadgesController < ApplicationController
  before_action :set_badges, only: %i[index show]

  def index; end

  def show; end

  private

  def set_badges
    @badges = current_user.badges
  end
end
