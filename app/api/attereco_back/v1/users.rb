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
        {
          email: user.email,
          name: user.name,
          sid: user.sid,
          laboratory: user.laboratory_text,
          position: user.position_text,
          phone: user.phone
        }
      end

      desc 'attend schedule'
      params do
        requires :idm, type: String, desc: "card's idm"
        requires :schedule_id, type: Integer, desc: 'specify schedule'
        requires :token, type: String, desc: 'api token'
      end
      post ':idm/attend' do
        user = Card.find_by(idm: params[:idm]).try(:user)
        return error! 'Not Found', 404 unless user
        schedule = Schedule.find_by(id: params[:schedule_id])
        return error! 'Not Found', 404 unless schedule
        Attend.create(user_id: user.id, schedule_id: schedule.id)
        {
          sid: user.sid,
          name: user.name,
          message: schedule.caption
        }
      end
    end
  end
end
