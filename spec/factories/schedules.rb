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
#  assigned_user_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryGirl.define do
  factory :schedule do
    start_at '2015-07-17 19:00'
    end_at '2015-07-17 21:00'
    place '1909演習室'
    caption '定例活動'
    scheduled_date '2015-07-17'
  end
end
