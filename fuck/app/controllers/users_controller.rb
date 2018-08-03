class UsersController < ApplicationController

  def index
    p "```````````````"
    p current_user
    p "----------------"
    if current_user.role != "admin"
        redirect_to root_path
    end
    else
    @users =User.all
  end
  def new
    @user = User.new
  end

  def show
    p current_user.id
    p "----------------"
    a= Integer(params[:id])
    if  current_user.id != a
      redirect_to root_path
    end
    else
    @user = current_user
  end
  def edit
    # if current_user.role != "admin"
    #   redirect_to root_path
    # end
    # else
      @user = current_user
  end
  def update
    @user = current_user
     if @user.update(user_params)
      else
      render 'edit'
    end
  end
  def destroy
    @user = current_user
    @user.destroy
    redirect_to users_path
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Register success"
      redirect_to login_path
    else
      flash[:success] = "Register failed"
      render :new
    end
  end
  private
  def user_params
    params.require(:user).permit :email, :name, :role, :password, :password_confirmation
  end
end
