class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    if sign_in? 
      @users = User.all
    else
      flash[:error] = "Please sign in first."
      redirect_to signin_path
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if sign_in? 
      @user = User.find(params[:id])
    else
      flash[:error] = "Please sign in first."
      redirect_to signin_path
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    if sign_in? 
      @user = User.find(params[:id])
    else
      flash[:error] = "Please sign in first."
      redirect_to signin_path
    end
  end

  # POST /users
  # POST /users.json
  def create
      @user = User.new(params[:user])
      if @user.save
        # redirect_to @user, notice: "User was successfully created."
        # render :text => "User was successfully created."
        # NEED TO SET NEW SESSIONS!!
      else
        flash[:error] = "Registeration was not successful."
        render action: 'new'
      end

    # if @user.save
    #   redirect_to @user, notice: "User was successfully created."
    # else
    #   render action: "new"
    # end

    # respond_to do |format|
    #   if @user.save
    #     format.html { redirect_to @user, notice: 'User was successfully created.' }
    #     format.json { render json: @user, status: :created, location: @user }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    if sign_in? 
    else
      flash[:error] = "Please sign in first."
      redirect_to signin_path
    end

    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if sign_in? 
    else
      flash[:error] = "Please sign in first."
      redirect_to signin_path
    end

    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
