class Group < ApplicationRecord
  has_many :group_users
  has_many :user, through: :group_users

  accepts_nested_attributes_for :group_users
end
