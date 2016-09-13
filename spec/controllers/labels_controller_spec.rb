require 'rails_helper'

describe LabelsController do
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates the label' do
        post :create, label: attributes_for(:label)
        expect(Label.count).to eq(1)
      end

      it 'redirects to the "show" action for the new label' do
        post :create, label: attributes_for(:label)
        expect(response).to redirect_to Label.first
      end
    end

    context 'with invalid attributes' do
      it 'does not create the label' do
        post :create, label: attributes_for(:label, name: nil)
        expect(Label.count).to eq(0)
      end

      it 're-renders the "new" view' do
        post :create, label: attributes_for(:label, name: nil)
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #index' do
    it "assigns @labels" do
      label = FactoryGirl.create(:label)
      get :index
      expect(assigns(:labels)).to eq([label])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

  end
end
