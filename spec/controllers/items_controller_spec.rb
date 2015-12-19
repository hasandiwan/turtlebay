require 'rails_helper'

describe ItemsController do

  context "#index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  context "#show" do
    let(:item) { FactoryGirl.create :item}
    it "has a 200 status code" do
      get :show, :id => item.id
      expect(response.status).to eq(200)
    end

    it "renders the show template" do
      get :show, :id => item.id
      expect(response).to render_template("show")
    end
  end

end