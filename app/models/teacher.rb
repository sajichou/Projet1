class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  has_many :cours, dependent: :destroy
  has_many :annees, dependent: :destroy
  has_one :role, dependent: :destroy
  has_one :infoteacher, dependent: :destroy
end
