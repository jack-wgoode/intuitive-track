class Technician < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
         has_many :tickets
         has_many :end_users, through: :tickets

         def self.from_google(uid:, email:, full_name:, avatar_url:)
         technician = Technician.find_or_create_by(email: email) do |u|
           u.uid = uid
           u.full_name = full_name
           u.avatar_url = avatar_url
           u.password = SecureRandom.hex
         end
           technician.update(uid: uid, full_name: full_name, avatar_url: avatar_url)
           technician
         end
end
