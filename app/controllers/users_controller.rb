class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user["username"] = params["user"]["username"]
    # @user["first_name"] = params["user"]["first_name"]
    # @user["last_name"] = params["user"]["last_name"]
    @user["email"] = params["user"]["email"]
    # @user["password"] = params["user"]["password"]
    @user["password"] = BCrypt::Password.create(params["user"]["password"])
    @user.save
    redirect_to "/"
      end
end
