require 'rails_helper'

RSpec.describe 'Properties API', type: :request do
  let!(:properties) { create_list(:property, 5) }
  let(:property_id) { properties.first.id }

  describe "GET /properties" do
    before { get "/properties" }

    it "returns properties" do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /properties/:id" do
    before { get "/properties/#{property_id}"}

    context "when the record exists" do
      it "returns the property" do
        expect(json).not_to be_empty
        expect(json['id']).to eq(property_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context "when the record does not exist" do
      let(:property_id) { 100 }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Property/)
      end
    end
  end

  describe "POST /properties" do
    let(:valid_attributes) { {
      neighborhood: "Cool Neighborhood",
      description: "This is the discription",
      beds: 2,
      baths: 2,
      home_size: 1000,
      lot_size: 3000,
      type_of: "condo",
      status: "rented",
      address: {
       street_address: "5 Roady Rd",
       city: "Cityville",
       state: "FL",
       zip: "32082"
      }
    } }

    context "when the request is valid" do
      before { post "/properties", params: valid_attributes }

      it "creates a property" do
        expect(json['neighborhood']).to eq("Cool Neighborhood")
      end

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end

    context "when the request is invalid" do
      before { post "/properties", params: { neighborhood: "Foobar" } }

      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end

      it "returns a validation failure message" do
        expect(response.body)
          .to match(/Validation failed: Address can't be blank/)
      end
    end
  end

  describe 'PUT /properties/:id' do
    let(:valid_attributes) { {
      neighborhood: "Cool Neighborhood",
      description: "This is the discription",
      beds: 2,
      baths: 2,
      home_size: 1000,
      lot_size: 3000,
      type_of: "condo",
      status: "rented",
      address: {
       street_address: "5 Roady Rd",
       city: "Cityville",
       state: "FL",
       zip: "32082"
      }
    } }

    context 'when the record exists' do
      before { put "/properties/#{property_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /properties/:id' do
    before { delete "/properties/#{property_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
