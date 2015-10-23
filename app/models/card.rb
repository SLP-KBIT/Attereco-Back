# == Schema Information
#
# Table name: cards
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  idm        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Card < ActiveRecord::Base
  belongs_to :user
  validates :user_id, uniqueness: { scope: :idm }
end
