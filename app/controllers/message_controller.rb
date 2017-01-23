class MessageController < ApplicationController

  before_action: move_to_signed_in

  def index
  end

  def move_to_signed_in
    redirect_to new_user_session_path unless user_signed_in?
  end
end
