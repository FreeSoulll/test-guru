module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    author = "<p>Автор - #{author}</p>"
    link = link_to('Test guru', repo, target: '_blank')
    author.concat(link).html_safe
  end
end
