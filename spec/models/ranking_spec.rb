require 'rails_helper'

RSpec.describe Ranking, type: :model do
  let(:game) { FactoryGirl.create(:game) }
  describe "#new" do
    let(:ranking) { FactoryGirl.build(:ranking) }

    context "nil game_id" do
      it { expect(ranking).to be_invalid }
    end

    context "success" do
      before { ranking.game_id = game.id }
      it { expect(ranking).to be_valid }
    end
  end

  describe ".set_nickname" do
    let(:ranking) { FactoryGirl.build(:ranking) }

    subject { ranking.nickname }

    context "nil" do
      before do
        ranking.game_id = game.id
        ranking.nickname = nil
        ranking.save!
      end
      it { is_expected.to eq("Noname") }
    end

    context "empty" do
      before do
        ranking.game_id = game.id
        ranking.nickname = ""
        ranking.save!
      end
      it { is_expected.to eq("Noname") }
    end

    context "space only" do
      before do
        ranking.game_id = game.id
        ranking.nickname = "  "
        ranking.save!
      end
      it { is_expected.to eq("Noname") }
    end
  end

end
