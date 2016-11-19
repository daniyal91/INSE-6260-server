class UsersController < ApplicationController

  def options
    render text: ''
  end

  def index
    @users = User.all
    render json: @users.to_json
  end

  def show
    @user = User.find(params[:id])
    render json: @user.to_json
  end

  def create
    type = params[:type]
    user = {first_name: params[:firstName], last_name: params[:lastName],
            email: params[:email], username: params[:username], password: params[:password],
            gender: params[:gender], language: params[:language], address: params[:address], status: "deactivated"}
    if type == "patient"
      @user = Patient.new(user)
    elsif type == "nurse"
      @user = Nurse.new(user)
    else
    end
    if @user.save
      UserMailer.register_email(@user).deliver_now
      auth_key = @user.session_api_key
      render json: {user: @user, auth_key: auth_key}
    else
      render json: {message: @user.errors.full_messages}
    end
  end

  def update
    @user = User.find(params[:id])
     if @user.update(user_params)
        render json: @user
      else
        render json: {message: @user.errors.full_messages}
      end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      render json: @user
    else
      render json: {message: 'Something went wrong while deleting user'}
    end
  end

  def activate
    @user = User.find(params[:id])
    @user.status = "activated"
    if @user.save
      render json: {message: "User has been activated."}
    else
      render json: {message: "Something went wrong while activating user."}
    end
  end

  def deactivate
    @user = User.find(params[:id])
    @user.status = "deactivated"
    if @user.save
      render json: {message: "User has been deactivated."}
    else
      render json: {message: "Something went wrong while deactivating user."}
    end
  end

  private

  def user_params
    params.permit(:id, :first_name, :last_name, :email, :username, :password, :gender, :language, :address, :status)
  end

end
