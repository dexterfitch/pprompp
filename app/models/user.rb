class User < ApplicationRecord
  has_many :user_characters
  has_many :user_goals
  has_many :user_motivations
  has_many :user_tactics
  has_many :prompts
  has_many :characters, through: :prompts
  has_many :goals, through: :prompts
  has_many :motivations, through: :prompts
  has_many :tactics, through: :prompts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  validates :name, presence: true
  validates :species, presence: true
end
