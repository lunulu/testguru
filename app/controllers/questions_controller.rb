class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index; end

  def new; end

  def show; end

  def create
    question = @test.questions.new(question_params)
    if question.save
      redirect_to test_questions_url(test_id: @test.id)
    else
      # TODO: Информировать пользователя о неудаче
      render html: "<script>alert('No users!')</script>".html_safe
    end
  end

  def destroy
    @question.destroy
    # TODO: Перенаправлять после удаления
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render inline: '<p>Вопрос №<%= params[:id] %> не найден</p>'
  end
end
