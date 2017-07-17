# ------ Game Schema --------
# string "access_token_digest"
# string "access_key"
# datetime "access_token_created_at"
# ---------------------------
class Authenticator

  attr_accessor :ranking
  attr_reader :game
  attr_reader :access_token

  def initialize(ranking, key, token)
    @ranking = ranking
    @game = Game.find_by(access_key: key)
    @access_token = token
  end

  def save
    return false unless @game
    return false unless access_token == @game.access_token_digest
    
    @ranking.game_id = @game.id
    @ranking.save
  end

  def get_ranking
    if authenticated?
      return game.rankings
    else
      return nil
    end
  end

  private

  def authenticated?
    return false unless @game
    # looks good, use ActiveSupport::SecurityUtils.variable_size_secure_compare
    return false unless access_token == @game.access_token_digest

    return true
  end
end
