class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "Hello."
        redirect_to "/posts"
      else
        flash["notice"] = "Login First."
        redirect_to "/posts"
      end
    else
      flash["notice"] = "Login First."
      redirect_to "/places/{@post["place_id"]}
    end
  end

  
  def destroy
    session["user_id"] = nil
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end

end
