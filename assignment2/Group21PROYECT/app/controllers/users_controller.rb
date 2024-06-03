class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:show, :index]
    def index
        @users = User.all
    end
    def show
        @user = User.find(params['id'])
        @tasks = @user.tasks
        @boards = @user.boards
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        
        respond_to do |format|
          format.html { redirect_to users_url, notice: "user was successfully destroyed." }
          format.json { head :no_content }
        end
    end
    def user_params
		params.require(:user).permit(:name, :email, :password)
	end
end