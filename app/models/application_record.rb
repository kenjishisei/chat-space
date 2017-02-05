class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def non_message
    messages.blank? ? "まだメッセージはありません。" : messages.last[:body] ;
  end

  def  group_member
    each do |user|
      user.name
    end
  end
end
