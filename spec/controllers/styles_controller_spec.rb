require 'rails_helper'
RSpec.describe Api::V1::StylesController, type: :controller do
    describe "GET #index" do
        it "returns a success response" do
            style = FactoryBot.create(:style)
            get :index, params: {}
            expect(response).to be_successful
            expect(assigns(:styles)).to eq([style])
        end
    end

    describe "GET #show" do
        it "returns a success response" do
            style = FactoryBot.create(:style)
            get :show, params: {id: style.id}
            expect(response).to be_successful
            expect(assigns(:style)).to eq(style)
        end
    end

    describe "POST #create" do
        it "returns a success response" do
            style = FactoryBot.build(:style)
            post :create, params: { style: {name: style.name, description: style.description } }
            expect(response).to be_successful
            expect(assigns(:style).name).to eq(style.name)
            expect(assigns(:style).description).to eq(style.description)
        end
    end

    describe "PUT #update" do
        it "returns a success response" do
            style = FactoryBot.create(:style)
            new_style = FactoryBot.build(:style)
            put :update, params: { id: style.id, style: {name: new_style.name, description: new_style.description} }
            expect(response).to be_successful
            expect(assigns(:style).name).to eq(new_style.name)
            expect(assigns(:style).description).to eq(new_style.description)
        end
    end

    describe "DELETE #destroy" do
        it "returns a success response" do
            style = FactoryBot.create(:style)
            delete :destroy, params: { id: style.id }
            expect(response).to be_successful
            expect { Style.find(style.id) }.to raise_error(ActiveRecord::RecordNotFound)
        end
    end
end