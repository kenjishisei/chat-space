require 'rails_helper'
describe Message do
  describe '#create' do

    it "is valid with a body" do
      message = build(:message)
      expect(message).to be_valid
    end

    it "is invalid without a body" do
      message = build(:message, body: "")
      message.valid?
      expect(message.errors[:body]).to include("入力されていません")
    end
  end
end
