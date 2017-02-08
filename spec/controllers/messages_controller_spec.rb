require 'rails_helper'

describe MessagesController do
  let(:group) {create(:group)}
  let(:message) {create(:message)}
  let(:user) {create(:user)}

  before do
    sign_in user
  end

  describe 'GET #index' do
    it "renders the :index template" do
      get:index, group_id: group
      expect(response).to render_template :index
    end

    it "assigns the requested group to @group" do
      get :index, group_id: group
      expect(assigns(:group)).to eq group
    end

    it "assigns the requested message to @message" do
      get :index, group_id: group
      expect(assigns(:message)).to be_a_new(Message)
    end
  end
describe 'Post #create' do
  context "when save message" do
    it "when save new message to database" do
      expect{
      post :create, message: attributes_for(:message), user_id: user, group_id: group}.to change(Message, :count).by(1)
    end

    it "redirects to message#index" do
      post :create, message: attributes_for(:message), user_id: user, group_id: group
      expect(response).to redirect_to group_messages_path
    end
  end

  context "when don't save message" do
    it "when don't save new message to database" do
      expect{
      post :create, message: attributes_for(:message, body: nil), user_id: user, group_id: group}.to change(Message, :count).by(0)
    end

    it "render message#index" do
       post :create, message: attributes_for(:message, body: nil), user_id: user, group_id: group
       expect(response).to render_template :index
    end
  end
end
end
