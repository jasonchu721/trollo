class TasksController < ApplicationController
  before_action :set_list
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = @list.tasks
  end

  def show
  end

  def edit
  end

  def new
    @task =Task.new

    render parital: "form"
  end

  def create
    @task = @list.tasks.new(task_params)
    if @task.save
      redirect_to board_list_path(@list.board_id, @list)
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to [@list, @task]
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to list_tasks_path(@list)
  end

  private
    def set_list 
      @list = List.find(params[:list_id])
    end

    def set_task   
      @task = @list.tasks.find(params[:id])
    end 

    def task_params
      params.require(:task).permit(:name)
    end

end
