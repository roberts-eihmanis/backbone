class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, except: [:index, :show]

  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def show
    @user = User.find(params[:id])
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end
  end

  def edit
    @roles = ['admin', 'user', 'worker']
    @user = User.find(params[:id])
  end

  def new
    @roles = ['admin', 'user', 'worker']
    @user = User.new
  end

  def create
    @user = User.new(secure_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'Lietotājs veiksmīgi izveidots.' }
        format.json { redirect_to @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "Lietotājs atjaunots"
    else
      redirect_to @user, :alert => "Nespēja atjaunot lietotāju"
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def admin_only
    unless current_user.admin?
      redirect_to :back, :alert => "Access denied."
    end
  end

  def secure_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :phone_number, :role)
  end
end