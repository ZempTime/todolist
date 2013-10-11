class TasksController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)

    if @task.save
      redirect_to list_path(@list), notice: "Task was saved successfully!"
    else
      render "lists/show"
    end

  end

  def update
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    @task.complete!(params[:task][:completed_at])

    redirect_to list_path(@list)
  end

  def destroy
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    @task.destroy
    redirect_to list_path(@list)
  end

  private

    def task_params
      params.require(:task).permit(:description)
    end
    
end
