class UsersController < ApplicationController

  def new
    @users = User.new
  end

  def create
    User.create
  end

end
