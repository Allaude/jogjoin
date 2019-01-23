class UsersController < ApplicationController
  before_action :authenticate_user, only: [:update, :destroy]
  before_action :authorize, only: [:update, :destroy, :index]
    
  def index
    users = User.all
    render json: users
  end
    
  def create
    user = User.new(user_params)
    if user.save 
      render json: {msg:'User Created'}
    else
      render json: {msg:user.errors}, status: :bad_request 
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: {msg:'User Updated'}
    else
      render json: {msg:user.errors}, status: :bad_request
    end
  end
    
  def destroy
    user = User.find(params[:id])
    if user.destroy
      render json: {msg:'User Deleted'}
    else
      render json: {msg:user.errors}, status: :bad_request
    end
  end
    

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role, :phone, :address, :name_shop, :address_shop)
  end
    
  def authorize
    return :unauthorized unless current_user.is_admin? && current_user.can_modify?(params[:id])
  end

end
