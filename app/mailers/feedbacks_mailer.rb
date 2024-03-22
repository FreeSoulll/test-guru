class FeedbacksMailer < ApplicationMailer
  def feedback
    @feedback = params[:feedback]
    @user = @feedback.email
    @text = @feedback.content
    @admin_email = ENV['ADMIN_EMAIL']
    return unless @admin_email

    mail to: @admin_email
  end
end
