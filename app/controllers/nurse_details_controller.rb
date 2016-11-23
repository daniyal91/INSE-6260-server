class NurseDetailsController < ApplicationController

	def options
    render text: ''
  end

  def index
  	nurse_id = params[:nurse_id]
    @nurse_details = NurseDetail.where("nurse_id = ?",nurse_id)
    render json: @nurse_details.to_json
  end

  def show
    @nurse_detail = NurseDetail.find(params[:id])
    render json: @nurse_detail.to_json
  end

  def create
    nurse_detail = {nurse_id: params[:nurseId], service_id: params[:serviceId]}
    @nurse_detail = NurseDetail.new(nurse_detail)
    if @nurse_detail.save
      render json: {nurse_detail: @nurse_detail}
    else
      render json: {message: @nurse_detail.errors.full_messages}
    end
  end

  def update
    @nurse_detail = NurseDetail.find(params[:id])
     if @nurse_detail.update(nurse_detail_params)
        render json: @nurse_detail
      else
        render json: {message: @nurse_detail.errors.full_messages}
      end
  end

  def destroy
    @nurse_detail = NurseDetail.find(params[:id])
    if @nurse_detail.destroy
      render json: @nurse_detail
    else
      render json: {message: 'Something went wrong while deleting nurse_detail'}
    end
  end

  def update_detail
  	nurse_id = params[:nurse_id]
  	service_id = params[:service_id]
  	nurse_detail = NurseDetail.where("nurse_id = ? AND service_id = ?",nurse_id,service_id)
  	if nurse_detail.empty?
  		NurseDetail.create(nurse_id: nurse_id, service_id: service_id)
  	else
  		# nothing
  	end
  	render json: {message: 'nurse_detail updated'}
  end

  def remove_detail
  	nurse_id = params[:nurse_id]
  	service_id = params[:service_id]
  	nurse_detail = NurseDetail.where("nurse_id = ? AND service_id = ?",nurse_id,service_id)
  	if !nurse_detail.empty?
  		nurse_detail.delete_all
  	else
  		# nothing
  	end
  	render json: {message: 'nurse_detail updated'}
  end

  private

  def nurse_detail_params
    params.permit(:id, :nurse_id, :service_id)
  end

end
