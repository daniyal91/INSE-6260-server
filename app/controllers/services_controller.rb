class ServicesController < ApplicationController

	def options
    render text: ''
  end

  def index
    @services = Service.all
    render json: @services.to_json
  end

  def show
    @service = Service.find(params[:id])
    render json: @service.to_json
  end

  def create
    service = {name: params[:name]}
    @service = Service.new(service)
    if @service.save
      render json: {service: @service}
    else
      render json: {message: @service.errors.full_messages}
    end
  end

  def update
    @service = Service.find(params[:id])
     if @service.update(service_params)
        render json: @service
      else
        render json: {message: @service.errors.full_messages}
      end
  end

  def destroy
    @service = Service.find(params[:id])
    if @service.destroy
      render json: @service
    else
      render json: {message: 'Something went wrong while deleting service'}
    end
  end

  private

  def service_params
    params.permit(:id, :name)
  end

end
