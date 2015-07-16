require 'rails_helper'

RSpec.describe AtterecoBack::V1::Users, type: :request do
  include_context 'api'

  describe 'GET /api/v1/users' do
    before do
      create(:user, id: 1)
      @card = create(:card, user_id: 1)
    end
    let(:url) { '/api/v1/users' }
    let(:method) { 'get' }
    context 'verified api token' do
      let(:parameters) do
        {
          idm: @card.idm,
          token: ENV['API_TOKEN']
        }
      end
      let(:result) do
        {
          email: @card.user.email,
          name: @card.user.name,
          sid: @card.user.sid,
          laboratory: @card.user.laboratory_text,
          position: @card.user.position_text,
          phone: @card.user.phone
        }
      end
      it_behaves_like '200 Success'
    end

    context 'unverified api token' do
      let(:parameters) do
        {
          idm: @card.idm,
          token: ENV['API_TOKEN'] + 'unverified'
        }
      end
      it_behaves_like '401 Unauthorized'
    end

    context 'does not exist idm' do
      let(:parameters) do
        {
          idm: @card.idm + "don't exist",
          token: ENV['API_TOKEN']
        }
      end
      it_behaves_like '404 Not Found'
    end
  end
end
