module Api
  class RentalRequestsController < ApplicationController
    def new
      @rent_req = RentalRequest.new
      render json: @rent_req
    end

    def create
      @rent_req = RentalRequest.new(rent_params)
      if @rent_req.save
        flash.now[:notice] = ['Request submitted!']
        render json: @rent_req
      else
        render json: @rent_req.errors, status: unprocessable_entity
      end
    end

    def show
      @rent_req = RentalRequest.find(params[:id])
      render json: @rent_req
    end

    private

    def rent_params
      params.require(:rental_requests).permit(:start, :leave, :renter_id, :boat_id)
    end
  end
end
