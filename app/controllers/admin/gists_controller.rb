class Admin::GistsController < Admin::BaseController
  def index
    @gists = Gist.all
  end

  def destroy
    @gist = Gist.find(params[:id])

    service = GistQuestionService.new
    @gist.destroy if service.delete_gist(gist: @gist)

    redirect_to admin_gists_path
  end
end
