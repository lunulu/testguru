class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    gist = Gist.new(question: @test_passage.current_question, user: @test_passage.user)
    client = GistQuestionService.new(gist)
    result = client.create_gist

    if result.status == 201
      flash_options = { notice: helpers.link_to('Gist', result.data[:html_url]) + t('.success') }
      gist.gist_id = result.data[:id]
      gist.save
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
