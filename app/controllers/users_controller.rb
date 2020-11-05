class UsersController < ApplicationController
  
  def index
    if user_signed_in?
      @currentUser=current_user
    end
    if chofer_signed_in?
      redirect_to chofer_path
    end
    if admin_signed_in?
      redirect_to admin_path
    end
    if not(admin_signed_in?) and not(user_signed_in?) and not(chofer_signed_in?)
      authenticate_user!
    end
  end

end
