require 'rails_helper'

RSpec.describe AtterecoBack::V1::Users, type: :request do
  include_context 'api'

  context 'GET /api/v1/users' do
    let(:url) { '/api/v1/users' }
    let(:method) { 'get' }
    describe 'test api' do
      let(:result) do
        { result: 'response test' }
      end
      it_behaves_like '200 Success'
    end
  end
end
