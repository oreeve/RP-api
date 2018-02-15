class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :update, :destroy]

  def index
    @properties = Property.all
    json_response(@properties)
  end

  def create
    @property = Property.create!(property_params)
    json_response(@property, :created)
  end

  def show
    json_response(@property)
  end

  def update
    @property.update(property_params)
    head :no_content
  end

  def destroy
    @property.destroy
    head :no_content
  end

  private

  def property_params
    params.permit(
      :neighborhood,
      :description,
      :beds,
      :baths,
      :home_size,
      :lot_size,
      :type_of,
      :status,
      address: [
        :street_address,
        :city,
        :state,
        :zip
      ]
    )
  end

  def set_property
    @property = Property.find(params[:id])
  end
end
