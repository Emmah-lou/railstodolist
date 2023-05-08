class TasksController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    @tasks = Task.all
    render 'tasks/index'
  end
  def create
    @task = Task.new(task_params)
    @task.completed = false
    
    if @task and @task.save
      render 'tasks/create'   
    else
      render json: {errors: task.errors.full_messages}, status: 422
    end
  end
  def destroy
    @task = Task.find(params[:id])
    if @task and @task.destroy
      render json: {success: true}
    else
      render json: {errors: @task.errors.full_messages}, status: 422
    end
  end
  def mark_complete
    @task = Task.find_by(id: params[:id])
    if @task and @task.update(completed: true)
      render 'tasks/update'
    else
      render json: {errors: @task.errors.full_messages}, status: 422
    end
  end
  def mark_active
    @task = Task.find_by(params[:id])
    if @task and @task.update(completed: false)
      render 'tasks/update'
    else
      render json: {errors: @task.errors.full_messages}, status: 422
    end
    
  end

  private
  def task_params
    params.require(:task).permit(:content, :completed)
  end


end
