class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update]
  def index
    @users = User.all.order(:created_at)
  end

  def edit
  end

  def update
    @user.assign_attributes(user_params)
    @changed = @user.changed?
    @user.save
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :address, :city, :state, :postcode, :phone)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
