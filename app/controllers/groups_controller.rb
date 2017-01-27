class GroupsController < ApplicationController

  def new 
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.name.present?
      @group.save
    redirect_to root_path
  else
    render :new
  end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_id:[])
  end

end
