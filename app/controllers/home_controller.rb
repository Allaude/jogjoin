class HomeController < ApplicationController
  before_action :authenticate_user, only: [:auth]

  def index
    render json: {status: 200, app: 'Jogjoin'}
  end

  def auth
    render json: {status:200, msg:"You are currently login with #{current_user.name}"}
  end
    
end
