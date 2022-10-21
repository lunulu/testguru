class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def create
    FeedbackMailer.feedback(current_user, params[:message]).deliver_later
    redirect_to root_path
  end
end
