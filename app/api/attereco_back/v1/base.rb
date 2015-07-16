module AtterecoBack::V1
  class Base < Grape::API
    version 'v1', using: :path
    format :json

    helpers do
    end

    before do
    end

    mount Users
  end
end
