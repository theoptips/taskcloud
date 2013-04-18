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
    @task = Task.find(params[:id])
  end

  def create
    if sign_in?
      @task = Task.new
      @task.category = Category.find_by_id(params[:task][:category_id])
      @task.title = params[:task][:title]
      @task.user = User.find(session[:user_id])
      @task.thumbnail_url = '/assets/rails.png'
      @task.avatar = params[:task][:avatar]

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
    # render :text => params
    if sign_in?
      @task = Task.find(params[:id])
      @task.title = params[:task][:title]
      @task.content = params[:task][:content]
      @task.thumbnail_url = params[:task][:thumbnail_url]
      @task.is_complete = params[:task][:is_complete]
      @task.is_starred = params[:task][:is_starred]
      @task.priority = params[:task][:priority]
      @task.avatar = params[:task][:avatar]

      if @task.save
        redirect_to task_path(@task)
      else
        render action: 'edit'
      end
    else
      flash[:error] = "Please sign in first."
      redirect_to signin_path
    end
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
