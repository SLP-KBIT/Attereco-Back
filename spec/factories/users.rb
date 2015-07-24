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
#  provider               :string           not null
#  uid                    :string           not null
#  sid                    :string           not null
#  name                   :string           default(""), not null
#  role                   :integer          default(0), not null
#  token                  :string           not null
#  raw                    :text             not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

FactoryGirl.define do
  factory :user do
    provider 'linkus'
    uid '1'
    token 'token'
    raw 'raw'
    password 'hogehoge'
    sid 's99t000'
    name 'hoge'
  end
end
