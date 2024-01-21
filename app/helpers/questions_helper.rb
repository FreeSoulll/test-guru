module QuestionsHelper
  def question_header(title, type = 'update')
    return "Create New #{title} Question" if type == 'create'

    "Update New #{title} Question"
  end

  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    "<p>Автор - #{author}</p><a href='#{repo}' target='_blank'>Test guru</a>".html_safe
  end
end
