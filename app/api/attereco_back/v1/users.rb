module AtterecoBack::V1
  class Users < Grape::API
    resource :users do
      desc 'get user information'
      params do
        requires :idm, type: String, desc: "card's idm"
        requires :token, type: String, desc: 'api token'
      end
      get '' do
        user = Card.find_by(idm: params[:idm]).try(:user)
        return error! 'Not Found', 404 unless user
        user.schema
      end

      desc 'attend schedule'
      params do
        requires :idm, type: String, desc: "card's idm"
        # Next version
        # requires :schedule_id, type: Integer, desc: 'specify schedule'
        requires :token, type: String, desc: 'api token'
      end
      post ':idm/attend' do
        user = Card.find_by(idm: params[:idm]).try(:user)
        return error! 'Not Found', 404 unless user
        # Next version
        # schedule = Schedule.find_by(id: params[:schedule_id])
        schedule = Schedule.find_by(scheduled_date: Date.today)
        return error! 'Not Found', 404 unless schedule
        Attend.create(user_id: user.id, schedule_id: schedule.id)
        {
          sid: user.sid,
          name: user.name,
          message: schedule.caption
        }
      end

      desc 'provisional registration'
      params do
        requires :idm, type: String, desc: "card's idm"
        requires :sid, type: String, desc: "user's sid"
        requires :token, type: String, desc: 'api token'
      end
      post 'create' do
        user = User.create(sid: params[:sid], password: params[:sid].reverse)
        Card.create(idm: params[:idm], user_id: user.id)
        { result: :success }
      end
    end
  end
end
