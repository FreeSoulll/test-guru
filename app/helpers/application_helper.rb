module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    author = "<p>#{author}</p>"
    link = link_to('TestGuru', repo, target: '_blank')
    author.concat(link).html_safe
  end
end
