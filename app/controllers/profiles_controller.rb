class ProfilesController < ApplicationController
  before_action :set_user, only: [:index, :create, :update]

  def index
    if @user.present?
      @profile = @user
    else
      @profile = Profile.new
    end
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to user_path(current_user), notice: "プロフィールを編集しました"
    else
      render :index
    end
  end

  def update
    @profile = Profile.find(@user.id)
    if @profile.update(profile_params)
      redirect_to user_path(current_user), notice: "プロフィールを編集しました"
    else
      render :index
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:site, :organization, :self_introduction).merge(user_id: current_user.id)
  end

  def set_user
    @user = current_user.profile
  end

end
