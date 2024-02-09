class User < ApplicationRecord
  rolify
  has_many :articles, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true, length: {minimum:3}
  validates :email, presence: true, uniqueness: true
  validates :email, format:  URI::MailTo::EMAIL_REGEXP
  validates :mobile, presence: true, uniqueness: true, numericality: { only_integer: true }, length: { is: 10 }
  validates :address, presence: true

  before_save do
    self.name = name.titleize
    self.address = address.titleize
  end
  after_create :assign_default_role
  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
end
