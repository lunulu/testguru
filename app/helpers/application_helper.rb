module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'Test Guru', "https://github.com/#{author}/#{repo}"
  end

  def current_translations
    @translations ||= I18n.backend.send(:translations)
    @translations[I18n.locale].with_indifferent_access
  end

  def flashes
    return unless flash.any?

    types = { alert: :danger, notice: :success }

    flash.map do |type, message|
      content_tag :div, message.html_safe, class: "col col-md-4 text-center alert alert-#{types[type.to_sym]}", role: 'alert'
    end.join.html_safe
  end
end
