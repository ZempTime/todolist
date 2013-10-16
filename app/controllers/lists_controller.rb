class ListsController < ApplicationController
before_action :set_list, except: [:index, :new, :create]
  
  def index
    @list = List.new
    @lists = current_user.lists.all
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to root_path, notice: "List name was changed succesfully"
    else
      render action: :edit
    end
  end

  def show
    @task = Task.new
  end   

  def create
    @list = current_user.lists.new(list_params)

    if @list.save 
      redirect_to list_path(@list), notice: "List was created successfully!"
    else
      @lists = current_user.lists
      render action: :index
    end
  end

  def destroy
    @list.destroy
    redirect_to root_path, notice: "List deleted"
  end

  private
  
  def list_params
    params.require(:list).permit(:name)
  end 

  def set_list
    @list = current_user.lists.where(id: params[:id]).first
    redirect_to lists_path, notice: "List does not exist" if @list.nil?
  end
end
