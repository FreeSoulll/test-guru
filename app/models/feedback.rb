class Feedback
  attr_accessor :email, :content

  def initialize(params = {})
    @email = params[:email]
    @content = params[:content]
  end

  def valid?
    email.present? & content.present?
  end
end
