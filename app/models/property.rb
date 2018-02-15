class Property < ApplicationRecord
  has_many :images, dependent: :destroy
  validates_presence_of :address, :description, :beds, :baths, :home_size, :type_of, :status

  store_accessor :address, :street_address, :city, :state, :zip
end
