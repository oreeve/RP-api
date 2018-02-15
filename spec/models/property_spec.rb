require 'rails_helper'

RSpec.describe Property, type: :model do
  # Associations
  it { should have_many(:images).dependent(:destroy) }

  #  Validations
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:beds) }
  it { should validate_presence_of(:baths) }
  it { should validate_presence_of(:home_size) }
  it { should validate_presence_of(:type_of) }
  it { should validate_presence_of(:status) }
end
