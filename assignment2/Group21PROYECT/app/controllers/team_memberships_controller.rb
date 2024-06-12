class TeamMembershipsController < ApplicationController
    before_action :set_team, only: [:new, :create, :destroy]
  
    def new
      @users = User.all - @team.users
      @team_membership = TeamMembership.new
    end
  
    def create
      @team_membership = @team.team_memberships.build(team_membership_params)
      if @team_membership.save
        redirect_to teams_path, notice: 'User was successfully added to the team.'
      else
        render :new
      end
    end
  
    def destroy
      @team_membership = TeamMembership.find(params[:id])
      @team_membership.destroy
      redirect_to @team, notice: 'User was successfully removed from the team.'
    end
  
    private
  
    def set_team
      @team = Team.find(params[:team_id])
    end
  
    def team_membership_params
      params.require(:team_membership).permit(:user_id)
    end
  end
  