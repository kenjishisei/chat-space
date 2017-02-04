class MessagesController < ApplicationController
  before_action :set_group, only: %i(index create)

  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path(@group)
    else
      flash[:alert] = "メッセージが送信できませんでした。"
      render "index"
    end
  end


  private

  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end

  def set_group
    @user = current_user
    @group = Group.find(params[:group_id])
    @groups = @user.groups
  end
end

