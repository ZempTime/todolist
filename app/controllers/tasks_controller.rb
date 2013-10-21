class TasksController < ApplicationController
  def show
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])

    respond_to do |format|
      format.json
    end
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to list_path(@list), notice: "Task was saved successfully!" }
        format.json
      else
        format.html { render "lists/show" }
        format.json
      end
    end

  end

  def update
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    @task.complete!(params[:task][:completed_at])

    respond_to do |format|
      format.html { redirect_to list_path(@list) }
      format.json
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html {redirect_to list_path(@list)}
      format.json
    end

    # TODO:
    # Make this respond to both HTML and json request
    # Render destroy.json.jbuilder {success: true}
  end

  private

    def task_params
      params.require(:task).permit(:description)
    end
    
end
