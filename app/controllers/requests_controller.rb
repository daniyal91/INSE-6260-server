class RequestsController < ApplicationController

	def options
    render text: ''
  end

  def index
    patient_id = params[:patient_id]
    requests_all = Request.where("patient_id = ?",patient_id).includes(:service)
    @requests = {}
    requests = []
    requests_all.each do |req|
      request = {}
      request.merge!(id: req.id, patient_id: req.patient_id, preferred_date: req.preferred_date,
                     preferred_time: req.preferred_time.strftime("%I:%M%p"), preferred_location: req.preferred_location,
                     service_id: req.service_id, service: req.service.name)
      requests.push(request)
    end
    @requests.merge!(requests: requests)
    render json: @requests.to_json
  end

  def show
    @request = Request.find(params[:id])
    render json: @request.to_json
  end

  def create
    request = {patient_id: params[:patientId], preferred_time: params[:preferredTime], 
    					preferred_date: params[:preferredDate], preferred_location: params[:preferredLocation], 
    					service_id: params[:serviceId]}
    @request = Request.new(request)
    if @request.save
      render json: {request: @request}
    else
      render json: {message: @request.errors.full_messages}
    end
  end

  def update
    @request = Request.find(params[:id])
     if @request.update(request_params)
        render json: @request
      else
        render json: {message: @request.errors.full_messages}
      end
  end

  def destroy
    @request = Request.find(params[:id])
    if @request.destroy
      render json: @request
    else
      render json: {message: 'Something went wrong while deleting request'}
    end
  end

  private

  def request_params
    params.permit(:id, :patient_id, :preferred_time, :preferred_date, :preferred_location, :service_id)
  end

end
