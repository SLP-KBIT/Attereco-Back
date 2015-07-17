module AtterecoBack::V1
  class Schedules < Grape::API
    resource :schedules do
      desc 'get user information'
      params do
        requires :token, type: String, desc: 'api token'
      end
      get '' do
        schedules = Schedule.where(scheduled_date: Date.today)
        return error! 'Not Found', 404 if schedules.empty?
        schedules.schema
      end
    end
  end
end
