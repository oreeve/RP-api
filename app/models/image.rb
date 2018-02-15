class Image < ApplicationRecord
  belongs_to :property

  validates_presence_of :title, :url
end
