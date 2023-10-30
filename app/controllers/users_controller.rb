class UsersController < ApplicationController
  before_action :set_user

  def show
    @matches = @user.competitions.flat_map(&:matches)
    @competitions = @user.competitions
  end

  private
  
  def set_user
    @user = User.find(params[:id])
  end

end