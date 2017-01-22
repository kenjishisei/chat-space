class MessageController < ApplicationController

  before_move: move_to_signed_in

  def index
  end

  def move_to_signed_in
    redirect_to new_user_session_path uless user_signed_in?
  end
end
