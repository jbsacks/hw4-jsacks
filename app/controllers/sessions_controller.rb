class SessionsController < ApplicationController
  def new
  end

  def create
  end

  def destroy
  end

end

def create
  @user = User.find_by({ "email" => params["email"] })
  if @user
     if BCrypt::Password.new(@user["password"]) == params["password"]
      # assign a cookie
      session["user_id"] = @user["id"]
      # login the user
      flash["notice"] = "You've logged in."
      redirect_to "/places"
    else
      flash["notice"] = "Unsuccessful login."
      redirect_to "/sessions/new"
    end
  else
    flash["notice"] = "Unsuccessful login."
    redirect_to "/sessions/new"
  end
end
