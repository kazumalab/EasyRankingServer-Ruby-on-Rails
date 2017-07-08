class Ranking < ApplicationRecord
  belongs_to :game
  before_save :set_default_user_name

  private

    def set_default_user_name
      self.nickname = "Noname" if nickname.blank?
    end
end
