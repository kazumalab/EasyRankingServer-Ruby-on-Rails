require 'rails_helper'

describe User, type: :model do
  describe '#from_omniauth' do
    let(:auth) { OmniAuth.config.mock_auth[:twitter] }
    let(:user) { User.from_omniauth(auth) }

    context 'success' do
      it { expect(user).to be_valid }
    end
  end

  describe '#new' do
    let(:user) { FactoryGirl.build(:user) }
    subject { user }

    context "when empty username, faild" do
      before { user.username = nil }
      it { is_expected.to be_invalid }
    end

    context "when not found email, faild" do
      before { user.email = nil }
      it { is_expected.to be_invalid }
    end

    context "when invalid email, faild" do
      before { user.email = "hogehoge@gmail..com" }
      it { is_expected.to be_invalid }
    end

    context "when password too short, faild" do
      before { user.password = user.password_confirmation = "a" * 3 }
      it { is_expected.to be_invalid }
    end

    context "when same password, success" do
      before { user.password = user.password_confirmation = "hogehoge123" }
      it { is_expected.to be_valid }
    end

    context "success" do
      it { is_expected.to be_valid }
    end
  end
end