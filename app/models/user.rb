class User < ApplicationRecord
  has_many :created_characters, class_name: "Character"
  has_many :created_goals, class_name: "Goal"
  has_many :created_motivations, class_name: "Motivation"
  has_many :created_tactics, class_name: "Tactic"
  has_many :prompts
  has_many :characters, through: :prompts
  has_many :goals, through: :prompts
  has_many :motivations, through: :prompts
  has_many :tactics, through: :prompts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  
  def self.from_google(uid:, email:, full_name:, avatar_url:)
    user= User.find_or_create_by(email: email) do |u|
      u.uid = uid
      u.full_name = full_name
      u.avatar_url = avatar_url
      u.password = SecureRandom.hex
    end
    user.update(uid: uid, full_name: full_name, avatar_url: avatar_url)
    # BLOG
    user
  end

end
