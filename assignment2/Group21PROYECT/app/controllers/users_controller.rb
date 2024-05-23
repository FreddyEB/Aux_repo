class UsersController < ApplicationController
    def index
        @users = User.all
        #@state = State.all
    end

    def show
        @user = User.find(params['id'])
    end

    def new
		@user = User.new
	end

    def create  
		@user = User.new(user_params)
		if @user.save!
                flash[:notice] = 'User was successfully created.'
				redirect_to users_path
		else
                flash[:alert] = 'There was an error creating the user.'
				render :new
		end
	end

    def edit
		@user = User.find(params[:id])
	end

    def update
		@user = User.find(params[:id])
		if @user.update user_params
                flash[:notice] = 'User was successfully updated.'
				redirect_to users_path
		else
                flash[:alert] = 'There was an error updating the user.'
				render :edit
		end
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