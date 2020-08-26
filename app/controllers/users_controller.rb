class UsersController < ApplicationController
  def new
    @users = Userform.new
  end

  def create
    @user = Users.create(user_params)
    @user.save
  end

  private

  def user_params
    params.require(:user, :email, :password, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday)
  end
end
