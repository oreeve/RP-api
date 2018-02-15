require 'rails_helper'

RSpec.describe 'Images API' do
  let!(:property) { create(:property) }
  let!(:images) { create_list(:image, 10, property_id: property.id) }
  let(:property_id) { property.id }
  let(:id) { images.first.id }

  describe 'GET /properties/:property_id/images' do
    before { get "/properties/#{property_id}/images" }

    context 'when property exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all property images' do
        expect(json.size).to eq(10)
      end
    end

    context 'when property does not exist' do
      let(:property_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Property/)
      end
    end
  end

  describe 'GET /properties/:property_id/images/:id' do
    before { get "/properties/#{property_id}/images/#{id}" }

    context 'when property image exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the image' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when property image does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Image/)
      end
    end
  end

  describe 'POST /properties/:property_id/images' do
    let(:valid_attributes) { { title: 'Master Bedroom', url: 'www.google.com' } }

    context 'when request attributes are valid' do
      before { post "/properties/#{property_id}/images", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/properties/#{property_id}/images", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Title can't be blank/)
      end
    end
  end

  describe 'PUT /properties/:property_id/images/:id' do
    let(:valid_attributes) { { title: 'Master Bathroom' } }

    before { put "/properties/#{property_id}/images/#{id}", params: valid_attributes }

    context 'when image exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the image' do
        updated_image = Image.find(id)
        expect(updated_image.title).to match(/Master Bathroom/)
      end
    end

    context 'when the image does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Image/)
      end
    end
  end

  describe 'DELETE /properties/:id' do
    before { delete "/properties/#{property_id}/images/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
