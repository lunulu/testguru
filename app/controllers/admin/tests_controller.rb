class Admin::TestsController < Admin::BaseController
  before_action :set_test, only: %i[show edit update destroy start]

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
    @test = current_user.authored_tests.new(test_params)
    if @test.save
      redirect_to [:admin, @test], notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test]
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def rescue_with_test_not_found
    render inline: '<p>Test #<%= params[:id] %> not found</p>'
  end
end
