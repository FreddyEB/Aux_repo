class TasksController < ApplicationController
    before_action :authenticate_user!
    def index
        @tasks = Task.all
        @user_board = UserToBoard.all
    end

    def show
        @task = Task.find(params['id'])
    end

    def new
        if params[:state_id].present?
            @state = State.find(params[:state_id])
            @task = @state.tasks.build
        else
		    @task = Task.new
        end
	end

    def create  
		@task = Task.new(task_params)
        asignee = AsigneeTask.new(user_id: task_params[:user_id])
        if asignee.save
            respond_to do |format|
                if @task.save
                    format.html { redirect_to tasks_path, notice: "Task was successfully created." }
                    format.json { render :show, status: :created, location: @task }
                else
                    format.html { render :new, status: :unprocessable_entity }
                    format.json { render json: @task.errors, status: :unprocessable_entity }
                end
            end
        end
	end

    def edit
		@task = Task.find(params[:id])
	end

    def update
		@task = Task.find(params[:id])
		if @task.update task_params
				redirect_to tasks_path
		else
				render :edit
		end
	end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
    
        redirect_to tasks_path, :notice => "The task was deleted"
    end

    def task_params
		params.require(:task).permit(:title, :state_id, :description, :priority, :custom_attributes, :status, :user_id, :asignee_task_id)
	end
end