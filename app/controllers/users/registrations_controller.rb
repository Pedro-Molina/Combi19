 #frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
   before_action :configure_sign_up_params, only: [:create]
   before_action :configure_account_update_params, only: [:update]



  # GET /resource/sign_up
   def new
    super
   end

  # POST /resource
   def create
     super
   end

  # GET /resource/edit
   def edit
     super
   end

  # PUT /resource
   def update
     #byebug
     #params.require(:user).permit(:nombre, :apellido, :dni, :tarjeta, :FechaExpiracion)
     super
   end

  # DELETE /resource
   def destroy
     super
   end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
   def cancel
     super
   end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre, :apellido, :dni, :tarjeta, :FechaExpiracion])
     devise_parameter_sanitizer.permit(:account_update, keys: [:nombre, :apellido, :dni, :tarjeta, :FechaExpiracion])
  end

  # If you have extra params to permit, append them to the sanitizer.
   def configure_account_update_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre, :apellido, :dni, :tarjeta, :FechaExpiracion])
     devise_parameter_sanitizer.permit(:account_update, keys: [:nombre, :apellido, :dni, :tarjeta, :FechaExpiracion])
     #devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
   end

  # The path used after sign up.
   def after_sign_up_path_for(resource)
     super(resource)
   end

  # The path used after sign up for inactive accounts.
   def after_inactive_sign_up_path_for(resource)
     super(resource)
   end

   protected

   def update_resource(resource, params)
     parametros=params
     #esto es para que no aparezcan notificaciones
     if parametros[:current_password]&.present?
       pass=parametros[:current_password]
     else
      pass="1234567"
     end
     parametros[:password]=pass
     parametros[:password_confirmation]=pass
     return super
     # Require current password if user is trying to change password.
     #return super if params["password"]&.present?

     # Allows user to update registration information without password.
     #resource.update_without_password(parametros)
   end
end
