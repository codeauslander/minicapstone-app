class ApplicationController < ActionController::API
  include Knock::Authenticable
  def authenticate_admin
    unless current_user && current_user.admin
      render json:{message:"Your are unauthorized"},status: :unauthorized
    end
  end
end
