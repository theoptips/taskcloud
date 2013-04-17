class TasksController < ApplicationController
  def index
    if sign_in?
      @tasks = Task.order('created_at desc').all
    else
      flash[:error] = "Please sign in first."
      redirect_to signin_path
    end
  end

  def show
    if sign_in?
      @task = Task.find(params[:id])
    else
      flash[:error] = "Please sign in first."
      redirect_to signin_path
    end
  end

  def new
    if sign_in?
      @task = Task.new
    else
      flash[:error] = "Please sign in first."
      redirect_to signin_path
    end
  end

  def edit
  end

  def create
    if sign_in?
      @task = Task.new(params[:task])
      if @task.save
        render :text => "Successful!"
      else
        render :text => "Failed!"
      end
    else
      flash[:error] = "Please sign in first."
      redirect_to signin_path
    end
  end

  def update
  end

  def destroy
  end
end
