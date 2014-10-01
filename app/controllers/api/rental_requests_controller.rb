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
      @rent_reqs = RentalRequest.includes(:boat).all
      render json: @rent_reqs, include: :boat
    end

    def show
      @rent_req = RentalRequest.includes(:boat).find(params[:id])
      render :show
    end

    private

    def rent_params
      adj_params = params.require(:rental_requests).permit(:start, :leave, :renter_id, :boat_id, :guests)
      date_arr = a[:start].split("/")
      date_arr[0], date_arr[2] = date_arr[2], date_arr[0]
      adj_params[:start] = date_arr.join("/")

      date_arr = a[:stop].split("/")
      date_arr[0], date_arr[2] = date_arr[2], date_arr[0]
      adj_params[:stop] = date_arr.join("/")
      adj_params
    end
  end
end
