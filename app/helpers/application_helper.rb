module ApplicationHelper
  def render_flash_messages
    mapping = { notice: 'success', alert: 'danger' } #, notice: 'info'

    flash.reduce('') do |message, (key, value)|
      alert_class = "alert alert-#{mapping.fetch(key.to_sym, key)} alert-dismissible"
      message + content_tag(:div, role: 'alert', class: alert_class) do
        content_tag(:button, type: 'button', class: 'close', data: { dismiss: 'alert' }) do
          content_tag(:span, '&times;'.html_safe, 'aria-hidden' => 'true') +
            content_tag(:span, 'Close', class: 'sr-only')
        end + value.html_safe
      end
    end.html_safe
  end
end
