class BadgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @badges = current_user.badges.all
    @all_badges = Badge.all
  end
end
