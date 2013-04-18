class CategoriesController < ApplicationController
  def show
  	if sign_in?
      @tasks = Task.where("user_id = #{session[:user_id]}").order("created_at DESC").find_all_by_category_id(params[:id])
      @categories = Category.all
      # render :text => params
    else
      flash[:error] = "Please sign in first."
      redirect_to signin_path
    end
  end
end
