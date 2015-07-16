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
#  name                   :string           not null
#  laboratory             :integer          not null
#  position               :integer          not null
#  phone                  :string           not null
#  address                :string
#  birthday               :datetime
#  role                   :integer          default(0), not null
#  is_active              :boolean          default(TRUE), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

FactoryGirl.define do
  factory :user do
    email 'test@gmail.com'
    password 'hogehoge'
    sid 's99t000'
    name 'hoge'
    laboratory 0
    position 0
    phone '000-0000-0000'
  end
end
