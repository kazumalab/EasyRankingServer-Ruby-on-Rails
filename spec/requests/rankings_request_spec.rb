require 'rails_helper'

RSpec.describe "Ranking", type: :request do
  let(:game) { FactoryGirl.create(:game) }
  describe "#create" do
    context "token, key nothing faild" do
      before do
        post rankings_path, params: { ranking: { nickname: "John", :score=>"200" } }
      end
      it { expect(response).to redirect_to root_path }
    end

    context "access_token nothing faild" do
      before do
        post rankings_path, params: { key: game.access_key, ranking: { nickname: "John", :score=>"200" } }
      end
      it { expect(response).to redirect_to root_path }
    end

    context "access_key nothing faild" do
      before do
        post rankings_path, params: { access_token: game.access_token_digest, ranking: { nickname: "John", :score=>"200" } }
      end
      it { expect(response).to redirect_to root_path }
    end

    context "authenticated success" do
      before do
        post rankings_path, params: { key: game.access_key, access_token: game.access_token_digest, ranking: { nickname: "John", :score=>"200" } }
      end
      it { expect(response).to redirect_to games_path }
    end
  end
end