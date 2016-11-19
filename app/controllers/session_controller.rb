class SessionController < ApplicationController
	skip_before_filter :verify_authenticity_token

  def options
    render text: ''
  end

  def index
    render nothing: true
  end

  def create
    user = User.where("username = ? AND password = ?", params[:username], params[:password]).first
    if user
      if user.api_keys.length > 0
        if user.api_keys.first.expired_at < Time.now
          api_key = user.api_keys.first
          api_key.expired_at = 4.days.from_now
          api_key.save!
          render json: {auth_key: api_key, user: user, role: user.role}
        else
          render json: {auth_key: user.api_keys.first, user: user, role: user.role}
        end
      else
        render json: {auth_key: user.session_api_key, user: user, role: user.role}
      end
    else
      render json: {message: "Login failed."}
    end
  end
end
