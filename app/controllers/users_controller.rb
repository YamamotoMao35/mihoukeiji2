class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :withdrawal, :destroy]

  def show
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user), notice: "ユーザー情報を編集しました"
    else
      render :edit
    end
  end

  def withdrawal
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: "ユーザーを削除しました"
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
