class GistQuestionService
  def initialize(gist, client: nil)
    @gist = gist
    @question = @gist.question
    @test = @gist.question.test
    @user = @gist.user
    @client = client || Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def create_gist
    @client.create_gist(gist_params)

    @client.last_response
  end

  def delete_gist
    @client.delete_gist(@gist.gist_id)
  end

  private

  def gist_params
    {
      description: I18n.t('gist_question_service.gist_params.description', title: @test.title),
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
end
