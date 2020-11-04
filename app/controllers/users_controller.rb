class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  def logout
    redirect_to root_path
  end
end
