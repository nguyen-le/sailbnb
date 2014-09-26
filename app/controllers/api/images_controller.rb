module Api
  class ImagesController < ApplicationController
    def create
      @image = Image.new(image_params)
      if @image.save
        render json: @image
      else
        render json: @image.errors, status: :unprocessable_entity
      end
    end

    def show
      @image = Image.find(params[:id])
      render json: @image
    end

    private

    def image_params
      params.require(:image).permit(:filepicker_url, :boat_id)
    end
  end
end
