module FlashHelper
  def flash_message(flash)
    return if flash.blank?

    flash_messages = flash.map do |type, message|
      content_tag(:p, message, class: "flash #{type}")
    end

    flash_messages.join.html_safe
  end
end
