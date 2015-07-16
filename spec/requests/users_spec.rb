require 'rails_helper'

RSpec.describe AtterecoBack::V1::Users, type: :request do
  include_context 'api'

  context 'GET /api/v1/users' do
    before do
      create(:user, id: 1)
      @card = create(:card, user_id: 1)
    end
    let(:url) { '/api/v1/users' }
    let(:method) { 'get' }
    let(:parameters) { { idm: @card.idm } }
    describe 'return user information' do
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
  end
end
