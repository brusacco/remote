class ProfileController < ApplicationController
  before_action :set_profile, only: %i[show]

  def index
    @profiles = Profile.order(followers: :desc).limit(40)
  end

  def show
    @profiles = Profile.where.not(id: @profile.id).order(followers: :desc).limit(12)
    @posts = @profile.instagram_posts.order(posted_at: :desc).limit(12)
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end
end
