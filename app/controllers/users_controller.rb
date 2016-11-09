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
    user = {first_name: params[:first_name], last_name: params[:last_name],
            email: params[:email], username: params[:username], password: params[:password],
            gender: params[:gender], language: params[:language], address: params[:address], status: params[:status]}
    @user = User.new(user)
    if @user.save
      render json: {user: @user}
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

  private

  def user_params
    params.permit(:id, :first_name, :last_name, :email, :username, :password, :gender, :language, :address, :status)
  end

end
