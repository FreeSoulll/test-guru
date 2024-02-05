module FlashHelper
  def alert_flash(message)
    content_tag(:p, message, class: 'flash alert')
  end
end
