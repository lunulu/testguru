class TestsController < ApplicationController
  before_action :set_test, only: %i[show edit update destroy start]
  before_action :set_user, only: :start

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def show
    @questions = @test.questions
  end

  def edit; end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to test_questions_path(@test)
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to test_questions_path(@test)
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :user_id)
  end

  def rescue_with_test_not_found
    render inline: '<p>Test #<%= params[:id] %> not found</p>'
  end
end
