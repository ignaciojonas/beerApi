require 'rails_helper'
RSpec.describe Api::V1::BeersController, type: :controller do
    describe "GET #index" do
        it "returns a success response" do
            beer = FactoryBot.create(:beer)
            get :index, params: {}
            expect(response).to be_successful
            expect(assigns(:beers)).to eq([beer])
        end
    end

    describe "GET #show" do
        it "returns a success response" do
            beer = FactoryBot.create(:beer)
            get :show, params: {id: beer.id}
            expect(response).to be_successful
            expect(assigns(:beer)).to eq(beer)
        end
    end

    describe "POST #create" do
        it "returns a success response" do
            beer = FactoryBot.build(:beer)
            post :create, params: { beer: {name: beer.name, rating: beer.rating, style_id: beer.style.id} }
            expect(response).to be_successful
            expect(assigns(:beer).name).to eq(beer.name)
            expect(assigns(:beer).rating).to eq(beer.rating)
            expect(assigns(:beer).style_id).to eq(beer.style.id)
        end
    end

    describe "PUT #update" do
        it "returns a success response" do
            beer = FactoryBot.create(:beer)
            new_beer = FactoryBot.build(:beer)
            put :update, params: { id: beer.id, beer: {name: new_beer.name, rating: new_beer.rating, style_id: new_beer.style.id} }
            expect(response).to be_successful
            expect(assigns(:beer).name).to eq(new_beer.name)
            expect(assigns(:beer).rating).to eq(new_beer.rating)
            expect(assigns(:beer).style_id).to eq(new_beer.style.id)
        end
    end

    describe "DELETE #destroy" do
        it "returns a success response" do
            beer = FactoryBot.create(:beer)
            delete :destroy, params: { id: beer.id }
            expect(response).to be_successful
            expect { Beer.find(beer.id) }.to raise_error(ActiveRecord::RecordNotFound)
        end
    end
end