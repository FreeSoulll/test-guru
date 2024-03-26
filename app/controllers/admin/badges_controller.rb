class Admin::BadgesController < Admin::BaseController
  before_action :set_badges, only: %i[index update show]
  before_action :find_badge, only: %i[show edit update destroy]
  before_action :badge_rules, only: %i[new edit update]

  def index; end

  def show; end

  def new
    @badge = Badge.new
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def badge_rules
    @badge_rules = Badge.badge_rules
  end

  def set_badges
    @badges = Badge.all
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :image_url, :badge_type)
  end
end
