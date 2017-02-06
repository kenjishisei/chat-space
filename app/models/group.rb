class Group < ApplicationRecord
  validates :name, presence: true
  has_many :group_users
  has_many :users, through: :group_users
  has_many :messages

  accepts_nested_attributes_for :group_users

  def group_non_message
    messages.blank? ? "まだメッセージはありません。" : messages.last[:body] ;
  end

end
