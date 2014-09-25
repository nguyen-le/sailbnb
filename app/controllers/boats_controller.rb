module Api
  class BoatsController < ApplicationController
    def new
      @boat = Boat.new
      render json: @boat
    end

    def create
      @boat = Boat.new(boat_params)

      if @boat.save
        flash[:notice] = ['Boat was successfully created.']
        render json: @boat
      else
        render json: @boat.errors, status: :unprocessable_entity
      end
    end

    def index
      @boats = Boat.includes(:owner).all
      render json: @boats
    end

    def show
      @boat = Boat.includes(:owner).find(params[:id])
      render :show
    end

    private

    def boat_params
      params.require(:boat).permit(
        :name, :location,:type, :description, :price, :size
      )
    end
  end
end
