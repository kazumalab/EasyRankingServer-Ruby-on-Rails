# --------- Game Schema -------------
# string   : name
# string   : description
# string   : access_token_digest
# string   : access_key
# datetime : access_token_created_at
# -----------------------------------

class Game < ApplicationRecord
  has_many :rankings
  validates :name, presence: true, length: { maximum: 30 }

  before_save :create_token

  class << self
    def digest(string)
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine::MIN_COST
             else
               BCrypt::Engine.cost
              end
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end

    def new_key
      SecureRandom.hex(10)
    end
  end
  
  # 認証用のTokenを作る
  def create_token
    self.access_token_digest = Game.digest(Game.new_token)
    self.access_token_created_at = Time.zone.now
    self.access_key = Game.new_key
  end
end
