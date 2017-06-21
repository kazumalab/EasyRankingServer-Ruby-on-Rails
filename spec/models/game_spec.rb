require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "#create" do
    context 'valid' do
      let(:game) { Game.new(name: "legend of zelda") }
      it do
        expect(game).to be_valid
      end
    end

    context 'invalid empty' do
      let(:game) { Game.new(name: "") }
      it do
        expect(game).to be_invalid
      end
    end

    context 'invalid too long max 30' do
      let(:game) { Game.new(name: "#{"a" * 31}") }
      it do
        expect(game).to be_invalid
      end
    end
  end
end