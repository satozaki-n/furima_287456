class UsersController < ApplicationController
  def new
    @users = Userform.new
  end

  def create
    @user = UserFrom.new(user_params)
    @user.save
  end

  def destroy
    @user = UserForm.delete
    @user.destroy
  end

  private

  def user_params
    params.require(:user_form)
  end
end
