class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :products, through: :orders

  Roles = [ :admin , :default ]
  # def is?( requested_role )
  #   self.role == requested_role.to_s
  # end

  def admin?
  	self.role == 'admin'
  end
end
