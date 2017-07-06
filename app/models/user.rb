## ------------ User Schema --------------
# string : username
# string : email
# string : image_url
# string : provider
# string : uid
## ---------------------------------------

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:twitter]

  class << self
    def from_omniauth(auth)
      user = User.find_by(provider: auth[:provider], uid: auth[:uid])
      unless user
        user = User.new(
          username: auth[:info][:username],
          image_url: auth[:info][:image],
          provider: auth[:provider],
          uid: auth[:uid],
          email: "#{auth[:provider]}-#{auth[:uid]}@sample.com",
          password: Devise.friendly_token[0, 20]
        )
      end
      user
    end
  end
end
