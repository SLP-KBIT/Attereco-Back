require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#is_admin?' do
    context '管理者の場合' do
      before { @user = create(:user, role: 100) }
      it 'trueを返す' do
        expect(@user.is_admin?).to eq true
      end
    end

    context '非管理者の場合' do
      before { @user = create(:user, role: 0) }
      it 'falseを返す' do
        expect(@user.is_admin?).to eq false
      end
    end
  end
end
