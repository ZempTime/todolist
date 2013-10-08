class TasksController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.all
  end

  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to root_url
  end

  def update
    @task = Task.find(params[:id])
    @task.complete!(params[:task][:completed_at])

    redirect_to root_url
  end

  private

    def task_params
      params.require(:task).permit(:description)
    end
    
end
