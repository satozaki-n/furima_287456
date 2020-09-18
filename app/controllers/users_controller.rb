class UsersController < ApplicationController
  def new
    @users = Userform.new
  end

  def create
    @user = UserFrom.new(user_params)
    @user.save
  end

  private

  def user_params
    params.require(:user_form)
  end
end
