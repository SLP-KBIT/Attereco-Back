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
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :lockable

  has_many :cards
  has_many :attends
  has_many :schedules, through: :attends

  before_save :update_sid!

  LABORATORY = %w(無所属 富永研 林研 八重樫研 垂水研 安藤研 最所研 その他).freeze
  POSITION = %w(なし 会計 所長 副所長 会計 広報 物品 旅行 事務).freeze

  module Select
    ROLE = [['管理者', 100], ['一般', 0]]
    LABORATORY = LABORATORY.map.with_index { |labo, i| [labo, i] }
    POSITION = POSITION.map.with_index { |pos, i| [pos, i] }
  end

  def laboratory_text
    LABORATORY[laboratory.to_i]
  end

  def position_text
    POSITION[position.to_i]
  end

  def is_admin?
    100 <= role
  end

  def update_sid!
    self.sid = email.split('@').first
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
end
