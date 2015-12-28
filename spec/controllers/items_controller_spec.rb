require 'rails_helper'

describe ItemsController do

  let(:item) { FactoryGirl.create :item}

  describe "#index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "#show" do
    it "has a 200 status code" do
      get :show, id: item.id
      expect(response.status).to eq(200)
    end

    it "renders the show template" do
      get :show, id: item.id
      expect(response).to render_template("show")
    end
  end

  describe "#edit" do
    it "has a 200 status code" do
      get :edit, id: item.id
      expect(response.status).to eq(200)
    end

    it "renders the edit template" do
      get :edit, id: item.id
      expect(response).to render_template("edit")
    end
  end

  describe "#update" do
    it 'updates item with valid parameters' do
      expect {
        patch :update, id: item.id, item: { title: 'test' }
      }.to change { item.reload.title }.to('test')
    end

    it 'redirects after updating an item' do
      patch :update, id: item.id, item: { title: 'test' }
      expect(response).to redirect_to item_path(item.id)
    end

    it 'does not update an item with invalid parameters' do
      expect {
        patch :update, id: item.id, item: { title: nil }
      }.not_to change { item.reload.title }
    end

    it 'does not redirect with invalid parameters' do
      patch :update, id: item.id, item: { title: nil }
      expect(response).to render_template('items/edit')
    end
  end

end
