# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  sid                    :string           not null
#  name                   :string           default(""), not null
#  laboratory             :integer          default(0), not null
#  position               :integer          default(0), not null
#  phone                  :string           default(""), not null
#  address                :string
#  birthday               :datetime
#  role                   :integer          default(0), not null
#  status                 :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

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
