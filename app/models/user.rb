class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  after_update :edit_infouser


  def after_confirmation
	  Infouser.create user_id:self.id, email:self.email
	  UserMailer.signup(self).deliver
  end

  acts_as_paranoid

  has_many :demandes
  has_many :paiements
  has_many :inscriptions, dependent: :destroy
  has_one :infouser, dependent: :destroy
  has_many :stripe_customers
  has_many :contactmessages
  #has_many :notifications, foreign_key: :recipient_id
  has_many :notifications, as: :recipient
  has_many :absencesponctuelles

  def infouser
    Infouser.unscoped { super }
  end

  def edit_infouser
    self.infouser.update(email:self.email)
  end

end
