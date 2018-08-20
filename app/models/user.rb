class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable


  def after_confirmation
	  Infouser.create user_id:self.id, email:self.email
	  UserMailer.signup(self).deliver
  end

  acts_as_paranoid

  has_many :cours
  has_many :inscriptions, dependent: :destroy
  has_one :infouser, dependent: :destroy
  has_many :stripe_customers
  has_many :contactmessages
  #has_many :notifications, foreign_key: :recipient_id
  has_many :notifications, as: :recipient

end
