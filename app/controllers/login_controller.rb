class LoginController < ApplicationController

    def create
        @user = User.find_by({ "email" => params["email"] })
        if @user
          if @user["password"] == params["password"]
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

end
