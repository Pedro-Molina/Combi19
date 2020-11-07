class ChofersController < ApplicationController
  before_action :authenticate_chofer! , except: [:new,:create]
  before_action :authenticate_admin!, only: [:new,:create]

  def index
  end

  def new
    @chofer = Chofer.new
  end

  def create
    byebug
    @chofer = Chofer.new(params.require(:chofer).permit(:nombre, :password, :email, :apellido, :dni, :telefono))
    if @chofer.save
      redirect_to admin_path
    else
      render :new
    end
    return
  end
end
