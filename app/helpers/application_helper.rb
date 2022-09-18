module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'Test Guru', "https://github.com/#{author}/#{repo}"
  end

  def flashes
    return unless flash.any?

    flash.map do |type, message|
      content_tag :p, message, class: "flash #{type}"
    end.join.html_safe
  end
end
