require 'rails_helper'

describe "Games", type: :request do
  let!(:user) { FactoryGirl.create(:user) }
  describe "#new" do
    context 'when not login' do
      before { get new_game_path }
      it { expect(response).to redirect_to(new_user_session_path) }
    end
  end
end