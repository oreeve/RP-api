require 'rails_helper'

RSpec.describe Image, type: :model do
  # Associations
  it { should belong_to(:property) }

  # Validations
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:url) }
end
