# == Schema Information
#
# Table name: attends
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  schedule_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Attend < ActiveRecord::Base
  belongs_to :user
  belongs_to :schedule
  validates :user_id, uniqueness: { scope: :schedule_id }
end
