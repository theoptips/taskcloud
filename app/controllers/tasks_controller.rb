class TasksController < ApplicationController
  def index
    if sign_in?
      @tasks = Task.order('created_at desc').all
      @tasks = User.find(session[:user_id]).tasks.order('created_at desc').all
      @categories = Category.all
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
      @task = Task.new
      @task.category = Category.find_by_id(params[:task][:category_id])
      @task.title = params[:task][:title]
      @task.user = User.find(session[:user_id])
      @task.thumbnail_url = '/assets/rails.png'

      if @task.save
        redirect_to tasks_path
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
    @task = Task.find(params[:id])
    if (@task.user_id = session[:user_id])
      @task.destroy
      redirect_to tasks_path
    else
      render :text => "You don't have the permission to delete this task."
    end
  end
end
