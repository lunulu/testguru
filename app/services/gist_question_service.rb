class GistQuestionService
  def initialize(client: nil)
    @client = client || Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def create_gist(question:, user:)
    @question = question
    @test = @question.test
    @user = user

    @resource = @client.create_gist(gist_params)

    if @client.last_response.status == 201
      @gist = Gist.create(question: @question, user: @user, gist_id: @resource[:id])
    end
  end

  def success?
    @client.last_response.status.between?(200,299)
  end

  def html_url
    @resource[:html_url]
  end

  def delete_gist(gist:)
    @client.delete_gist(gist.gist_id)
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
