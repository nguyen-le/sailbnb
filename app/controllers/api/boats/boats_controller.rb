class BoatsController < ApplicationController
  def new
    @boat = Boat.new
    render json: @boat
  end

  def create
    @boat = Boat.new(boat_params)

    respond_to do |format|
      if @boat.save
        flash[:notice] = ['Boat was successfully created.']
        render json: @boat
      else
        render json: @boat.errors, status: :unprocessable_entity
      end
    end
  end

  def index
    @boat = Boat.all
    render json: @boats, include: []
  end
  private

  def boat_params
    params.require(:boat).permit(
      :name, :location,:type, :description, :price, :size
    )
  end
end
