class PropertySerializer < ActiveModel::Serializer
  attributes :id, :neighborhood, :description, :beds, :baths, :home_size, :lot_size, :type_of, :status, :address

  has_many :images
end
