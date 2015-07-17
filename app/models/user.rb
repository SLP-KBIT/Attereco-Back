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
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable
  has_many :cards
  has_many :attends
  has_many :schedules, through: :attends

  LABORATORY = %w(無所属 富永研 林研 八重樫研 垂水研 安藤研 最所研 その他).freeze
  POSITION = %w(なし 会計 所長 副所長 会計 広報 物品 旅行 事務).freeze

  def laboratory_text
    LABORATORY[laboratory.to_i]
  end

  def position_text
    POSITION[position.to_i]
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
end
