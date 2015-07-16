module AtterecoBack::V1
  class Users < Grape::API
    resource :users do
      desc 'this is test api'
      get '' do
        'response test'
      end
    end
  end
end
