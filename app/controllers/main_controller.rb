class MainController < ApplicationController
  before_action :redireccionar
  
  def redireccionar
      if user_signed_in?
        redirect_to user_path
      end
      if chofer_signed_in?
        redirect_to chofer_path
      end
      if admin_signed_in?
        redirect_to  rails_admin_path
      end
  end

  def default
  end
end
