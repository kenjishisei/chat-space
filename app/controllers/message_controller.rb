class MessageController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @group = Group.find(params[:group_id])
    @groups = @user.groups
  end

end
