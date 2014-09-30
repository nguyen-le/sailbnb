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

    def index
      boat = Boat.find(params[:boat_id])
      if boat.owner == current_user
        @rent_reqs = boat.rental_requests
      else
        @rent_reqs = boat.rental_requests.where(renter_id: current_user.id)
      end

      render json: @rent_reqs
    end

    def show
      @rent_req = Boat.find(params[:boat_id]).rental_requests.find(params[:id])
      render json: @rent_req
    end

    private

    def rent_params
      params.require(:rental_requests).permit(:start, :leave, :renter_id, :boat_id)
    end
  end
end
