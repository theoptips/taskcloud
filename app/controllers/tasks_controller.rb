class TasksController < ApplicationController
  def index
    @tasks = Task.order('created_at desc').all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(params[:task])
    if @task.save
      render :text => "Successful!"
    else
      render :text => "Failed!"
    end

  end

  def update
  end

  def destroy
  end
end
