require 'rails_helper'

describe "Games", type: :request do
  describe "#new" do
    before { get new_game_path }
    it { expect(response).to redirect_to(new_user_session_path) }
  end
end