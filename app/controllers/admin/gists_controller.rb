class Admin::GistsController < Admin::BaseController
  def index
    @gists = Gist.all
  end

  def destroy
    @gist = Gist.find(params[:id])

    @gist.destroy if GistQuestionService.new(@gist).delete_gist

    redirect_to admin_gists_path
  end
end
