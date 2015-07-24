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

class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :lockable, :omniauthable, password_length: 7..72

  has_many :cards
  has_many :attends
  has_many :schedules, through: :attends

  module Select
    ROLE = [['管理者', 100], ['一般', 0]]
  end

  def self.find_for_linkus(auth)
    user = User.find_by(uid: auth.uid)
    return update_linkus!(user, auth) if user

    User.create(
      name:     auth.info.name,
      provider: auth.provider,
      uid:      auth.uid,
      sid:      auth.info.sid,
      token:    auth.credentials.token,
      password: Devise.friendly_token[0, 20],
      raw: auth.to_json
    )
  end

  def self.update_linkus!(user, auth)
    user.update(
      name:     auth.info.name,
      provider: auth.provider,
      uid:      auth.uid,
      sid:      auth.info.sid,
      token:    auth.credentials.token,
      password: Devise.friendly_token[0, 20],
      raw: auth.to_json
    )
    user
  end

  def is_admin?
    100 <= role
  end

  def schema
    {
      email: email,
      name: name,
      sid: sid,
      laboratory: laboratory_text,
      position: position_text,
      phone: phone
    }
  end

  def update_without_current_password(params, *options)
    params.delete(:current_password)
    params.delete(:password) if params[:password].blank?
    params.delete(:password_confirmation) if params[:password_confirmation].blank?

    clean_up_passwords
    update_attributes(params, *options)
  end

  def email_required?
    false
  end
end
