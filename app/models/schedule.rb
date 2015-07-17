# == Schema Information
#
# Table name: schedules
#
#  id               :integer          not null, primary key
#  start_at         :datetime
#  end_at           :datetime
#  place            :string
#  caption          :string
#  scheduled_date   :date
#  user_id          :integer
#  assigned_user_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Schedule < ActiveRecord::Base
  def self.schema
    ret = {}
    all.each do |schedule|
      ret[schedule.id] = [
        {
          caption: schedule.caption,
          start_at: schedule.start_at,
          end_at: schedule.end_at
        }
      ]
    end
    ret
  end
end
