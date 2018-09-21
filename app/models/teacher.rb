class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  after_update :edit_infoteacher

  def after_confirmation
  	Role.create teacher_id:self.id
    Infoteacher.create teacher_id:self.id, email:self.email
  end

  acts_as_paranoid
  
  has_many :cours, dependent: :destroy
  has_many :demandes
  has_many :paiements
  has_many :annees, dependent: :destroy
  has_one :role, dependent: :destroy
  has_one :infoteacher, dependent: :destroy
  has_many :contactmessages
  has_many :notifications, as: :recipient
  has_many :notifications, as: :actor


  def infoteacher
    Infoteacher.unscoped { super }
  end

  def edit_infoteacher
    if self.infoteacher.present?
      self.infoteacher.update(email:self.email)
    end
  end


end
