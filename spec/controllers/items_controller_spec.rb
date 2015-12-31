require 'rails_helper'

describe ItemsController do

  let(:user) { FactoryGirl.create :user}
  let(:item) { FactoryGirl.create :item, seller: user}

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  describe "#index" do
    it "should have an index route" do
      get :index
      expect(response).to be_success
    end

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
    context "update item with valid parameters" do
      subject { patch :update, id: item.id, item: { title: "test" } }

      it "updates item with valid parameters" do
        expect{subject}.to change { item.reload.title }.to("test")
      end

      it "redirects after updating an item" do
        subject
        expect(response).to redirect_to item_path(item.id)
      end
    end

    context "update item with invalid parameters" do
      subject { patch :update, id: item.id, item: { title: nil } }

      it "does not update an item with invalid parameters" do
        expect{subject}.not_to change { item.reload.title }
      end

      it "does not redirect with invalid parameters" do
        subject
        expect(response).to render_template("items/edit")
      end

      it "should set flash errors" do
        subject
        expect(flash.now[:error]).to eq(["Title can't be blank"])
      end
    end

  end

  describe "#destroy" do

    context "current user is owner of item" do
      subject { delete :destroy, {id: item.id }}

      it "redirects to the root_path" do
        expect(subject).to redirect_to(root_path)
      end

      it "should set a flash notice" do
        subject
        expect(flash[:notice]).to eq("You have successfully deleted your #{item.title}.")
      end

      it "deletes an item" do
        item
        expect{subject}.to change{ Item.count }.by(-1)
      end
    end

  end

end

