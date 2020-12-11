class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:registroExpress, :crearExpress]
  	
  def index
  end

  def registroExpress
  	@user = User.new
  end

  def crearExpress
  	byebug
  	usuario = User.new(password:"1234567",password_confirmation:"1234567",FechaExpiracion: Date.today,tarjeta:"1234567890123456",nombre:"Perez", apellido:"Garcia", email:params[:user][:email], dni:params[:user][:dni])
  	usuario.save

  	
  end
end
