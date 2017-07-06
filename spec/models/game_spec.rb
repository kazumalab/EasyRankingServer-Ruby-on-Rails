require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "#new" do
    let(:game) { FactoryGirl.build(:game) }
    subject { game }
    context 'valid' do
      before { game.name = "legend of zelda" }
      it { is_expected.to be_valid }
    end

    context 'invalid empty' do
      before { game.name = " " }
      it { is_expected.to be_invalid }
    end

    context 'invalid too long max 30' do
      before { game.name = "a" * 31 }
      it { is_expected.to be_invalid }
    end
  end

  describe '.create_token' do
    let(:game) { FactoryGirl.create(:game) }
    context 'token exit' do
      it { expect(game.access_token_digest).not_to eq(nil) }
    end

    context 'key exit' do
      it { expect(game.access_key).not_to eq(nil) }
    end

    context 'token create exit' do
      it { expect(game.access_token_created_at).not_to eq(nil) }
    end
  end
end