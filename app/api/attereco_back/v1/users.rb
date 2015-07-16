module AtterecoBack::V1
  class Users < Grape::API
    resource :users do
      desc 'get user information'
      params do
        requires :idm, type: String, desc: "card's idm"
      end
      get '' do
        user = Card.find_by(idm: params[:idm]).user
        {
          email: user.email,
          name: user.name,
          sid: user.sid,
          laboratory: user.laboratory_text,
          position: user.position_text,
          phone: user.phone
        }
      end
    end
  end
end
