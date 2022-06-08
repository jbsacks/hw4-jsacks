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
        # flash["notice"] = "Hello."
        redirect_to "/posts"
      else
        flash["notice"] = "Nope."
        redirect_to "/posts"
      end
    else
      flash["notice"] = "Nope."
      redirect_to "/login"
    end
  end

  # def create
  #   @post = Post.new
  #   @post["title"] = params["post"]["title"]
  #   @post["description"] = params["post"]["description"]
  #   @post["posted_on"] = params["post"]["posted_on"]
  #   @post["place_id"] = params["post"]["place_id"]
  #   @post.save
  #   redirect_to "/places/#{@post["place_id"]}"
  # end

  def destroy
    session["user_id"] = nil
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end

end
