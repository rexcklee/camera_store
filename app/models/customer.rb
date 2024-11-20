class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders

  belongs_to :province, optional: true

  # enum :province, [ :AB, :BC, :MB, :NB, :NL, :NT, :NS, :NU, :ON, :PE, :QC, :SK, :YT ]
end
