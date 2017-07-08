require 'rails_helper'

describe "Users", type: :request do
  let!(:user) { FactoryGirl.create(:user) }
  describe "#sign_in" do
    context 'when success' do
      before do
        login(user)
        get new_game_path
      end
      it { expect(response.status).to eq(200) }
    end

    context 'when no login, faild' do
      before do
        get new_game_path
      end
      it { expect(response.status).to eq(302) }
    end
  end
end