class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, 
         :rememberable, :validatable #borre  :registerable, para que no se puedan registrar como administradores

  validates :email, presence:true, uniqueness:true
  validates :password, presence:true
  validates :password_confirmation, presence:true
  rails_admin do
    exclude_fields :created_at, :updated_at, :remember_created_at, :reset_password_sent_at
  end
end
