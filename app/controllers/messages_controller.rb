class MessagesController < ApplicationController
  before_action :set_group, only: %i(index create)

  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
       respond_to do |format|
        format.html { redirect_to group_messages_path }
        format.json { render 'messages', handlers: 'jbuilder' }
      end
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
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
  end
end

