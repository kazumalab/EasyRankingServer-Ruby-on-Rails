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

  def is_confirmation?

  end

  class << self
    def from_omniauth(auth)
      user = User.find_by(provider: auth.provider, uid: auth.uid)
      unless user
        User.create(
          username: auth.extra.raw_info.name,
          image_url: auth.info.image,
          provider: auth.provider,
          uid: auth.uid,
          email: "#{auth.provider}-#{auth.uid}@sample.com",
          password: Devise.friendly_token[0, 20]
        )
      end
      user.skip_confirmation!
      user
    end
  end
end
