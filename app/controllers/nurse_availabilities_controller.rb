class NurseAvailabilitiesController < ApplicationController

	def options
    render text: ''
  end

  def index
    nurse_id = params[:nurse_id]
    nurse_availabilities_all = NurseAvailability.where("nurse_id = ?",nurse_id)
    @nurse_availabilities = {}
    nurse_availabilities = []
    nurse_availabilities_all.each do |av|
      nurse_availability = {}
      nurse_availability.merge!(id: av.id, nurse_id: av.nurse_id, available_time1: av.available_time1.strftime("%I:%M%p"),
                     available_time2: av.available_time2.strftime("%I:%M%p"),
                     available_time3: av.available_time3.strftime("%I:%M%p"),
                     available_time4: av.available_time4.strftime("%I:%M%p"),
                     available_time5: av.available_time5.strftime("%I:%M%p"),
                     available_date: av.available_date)
      nurse_availabilities.push(nurse_availability)
    end
    @nurse_availabilities.merge!(nurse_availabilities: nurse_availabilities)
    render json: @nurse_availabilities.to_json
  end

  def show
    @nurse_availability = NurseAvailability.find(params[:id])
    render json: @nurse_availability.to_json
  end

  def create
    nurse_availability = {nurse_id: params[:nurseId], available_time1: params[:availableTime1],
              available_time2: params[:availableTime2], available_time3: params[:availableTime3],
              available_time4: params[:availableTime4], available_time5: params[:availableTime5],
    					available_date: params[:availableDate]}
    @nurse_availability = NurseAvailability.new(nurse_availability)
    if @nurse_availability.save
      render json: {nurse_availability: @nurse_availability}
    else
      render json: {message: @nurse_availability.errors.full_messages}
    end
  end

  def update
    @nurse_availability = NurseAvailability.find(params[:id])
     if @nurse_availability.update(nurse_availability_params)
        render json: @nurse_availability
      else
        render json: {message: @nurse_availability.errors.full_messages}
      end
  end

  def destroy
    @nurse_availability = NurseAvailability.find(params[:id])
    if @nurse_availability.destroy
      render json: @nurse_availability
    else
      render json: {message: 'Something went wrong while deleting nurse_availability'}
    end
  end

  private

  def nurse_availability_params
    params.permit(:id, :nurse_id, :available_time1, :available_time2, :available_time3, :available_time4, :available_time5, :available_date)
  end

end
