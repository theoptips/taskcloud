class CategoriesController < ApplicationController
  def show
  	if sign_in?
      @tasks = Task.where("user_id = #{session[:user_id]}").order("created_at DESC").find_all_by_category_id(params[:id])
      @columns = Array.new()
      @columns[0] = Array.new()
      @columns[1] = Array.new()
      @columns[2] = Array.new()
      @tasks.each do |task|
        #random = rand(0..2) # rand(0..2) returns floats, heroku error
        random = rand(3)
        @columns[random].push(task)
      end

      # puts @columns

      @categories = Category.all
      # render :text => params
    else
      flash[:error] = "Please sign in first."
      redirect_to signin_path
    end
  end
end
