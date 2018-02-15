class ImagesController < ApplicationController
  before_action :set_property
  before_action :set_property_image, only: [:show, :update, :destroy]

  def index
    json_response(@property.images)
  end

  def show
    json_response(@image)
  end

  def create
    @property.images.create!(image_params)
    json_response(@property, :created)
  end

  def update
    @image.update(image_params)
    head :no_content
  end

  def destroy
    @image.destroy
    head :no_content
  end

  private

  def image_params
    params.permit(:title, :description, :url)
  end

  def set_property
    @property = Property.find(params[:property_id])
  end

  def set_property_image
    @image = @property.images.find_by!(id: params[:id]) if @property
  end
end
