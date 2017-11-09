module ApplicationHelper

  def bootstrap_class_for flash_type
    {success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info"}[flash_type.to_sym] || flash_type.to_s
  end

  # flash messages display
  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible", role: 'alert') do
        concat(content_tag(:button, class: 'close', data: {dismiss: 'alert'}) do
          concat content_tag(:span, '&times;'.html_safe, 'aria-hidden' => true)
          concat content_tag(:span, 'Close', class: 'sr-only')
        end)
        concat message
      end)
    end
    nil
  end

  # model errors display
  def form_errors_messages(entity, opts = { flash: false })
    if entity.errors.any?
      concat(content_tag(:div, nil, class: "alert #{bootstrap_class_for(:error)} alert-dismissible", role: 'alert') do
        concat(content_tag(:button, class: 'close', data: {dismiss: 'alert'}) do
          concat content_tag(:span, '&times;'.html_safe, 'aria-hidden' => true)
          concat content_tag(:span, 'Close', class: 'sr-only')
        end)
        concat(
            content_tag(:ul) do
              entity.errors.full_messages.each do |error|
                concat(
                    content_tag(:li) do
                      error
                    end
                )
              end
            end
        )
      end)
    elsif opts[:flash] and flash.any?
      flash_messages
      flash.clear
    end
    nil
  end

end
