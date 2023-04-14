class User < ApplicationRecord
  # before_action :authenticate_user!
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # enum role: { buyer: 0, seller: 1, admin: 2 }
  has_many :locations

  enum role: %i[buyer seller admin]
  after_initialize :set_default_role

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  private

  def set_default_role
    self.role ||= :buyer
  end
end
