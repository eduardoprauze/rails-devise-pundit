class UsersController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @users = User.all
    @labels = Label.all
    authorize User
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  def add_label
    user = params[:user]
    label = params[:label]
    UserLabel.where(user_id: user, label_id: label).first_or_create(user_id: user, label_id: label)
    @users = User.all
    @labels = Label.all
    authorize User
    respond_to do |format|
      format.js { render 'update_user_labels' }
    end
  end

  def delete_label
    user = params[:user]
    label = params[:label]
    UserLabel.where(user_id: user, label_id: label).first.destroy
    @users = User.all
    @labels = Label.all
    authorize User
    respond_to do |format|
      format.js { render 'update_user_labels' }
    end
  end

  private

  def secure_params
    params.require(:user).permit(:role)
  end

end
