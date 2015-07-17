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
end
