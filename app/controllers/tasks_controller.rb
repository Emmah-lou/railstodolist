class TasksController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @tasks = Task.all
  end
  def create
    task = Task.new(content: params[:content], completed: false)
    render json: {task: task}
  end
  def destroy
  end
  def update
  end

end
