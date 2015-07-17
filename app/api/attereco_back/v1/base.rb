module AtterecoBack::V1
  class Base < Grape::API
    version 'v1', using: :path
    format :json

    helpers do
      def authenticate!
        error! 'Unauthorized.', 401 unless params[:token] == ENV['API_TOKEN']
      end
    end

    before do
      authenticate!
    end

    mount Users
    mount Schedules
  end
end
