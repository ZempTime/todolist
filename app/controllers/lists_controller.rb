class ListsController < ApplicationController
  
  def index
    @list = List.new
    @lists = List.all
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to root_path, notice: "List name was changed succesfully"
    else
      render action: :edit
    end
  end

  def show
    @list = List.find(params[:id])
    @task = Task.new
  end

  def create
    @list = List.new(list_params)

    if @list.save 
      redirect_to list_path(@list), notice: "List was created successfully!"
    else
      @lists = List.all
      render action: :index
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to root_path, notice: "List deleted"
  end

  private
  
  def list_params
    params.require(:list).permit(:name)
  end
end
