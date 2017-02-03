class MessagesController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @group = Group.find(params[:group_id])
    @groups = @user.groups
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path(params[:group_id])
    else
      flash[:alert] = "メッセージが送信できませんでした。"
      render "index"
    end
  end


  private

  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end

