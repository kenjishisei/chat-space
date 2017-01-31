class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update]

  def index
    @groups = Group.all
    @group = Group.first()
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_paramas)
      redirect_to group_path
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids:[])
    end

  def set_group
    @group = Group.find(params[:id])
  end
end
