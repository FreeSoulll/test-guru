class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @test = @question.test

    @client = client || Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def call
    gist = @client.create_gist(gist_params)

    succes? ? gist : nil
  end

  private

  def gist_params
    {
      description: I18n.t('.gist.description', title: @test.title),
      public: true,
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

  def succes?
    last_responce = @client.last_response
    last_responce.status >= 200 && last_responce.status < 300
  end
end
