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

  describe 'POST /api/v1/users/:idm/attend' do
    before do
      create(:user, id: 1)
      @card = create(:card, user_id: 1)
      @schedule = create(:schedule, id: 1)
    end
    let(:url) { "/api/v1/users/#{@card.idm}/attend" }
    let(:method) { 'post' }
    context 'exist schedule' do
      let(:parameters) do
        {
          idm: @card.idm,
          token: ENV['API_TOKEN'],
          schedule_id: 1
        }
      end
      let(:result) do
        {
          'sid' => @card.user.sid,
          'name' => @card.user.name,
          'message' => @schedule.caption
        }
      end
      it_behaves_like '201 Created'
      it 'created attend' do
        post(url, parameters, rack_env)
        expect(@card.user.schedules.first.id).to eq 1
      end
    end

    context 'does not exist schedule' do
      let(:parameters) do
        {
          idm: @card.idm,
          token: ENV['API_TOKEN'],
          schedule_id: 2
        }
      end
      it_behaves_like '404 Not Found'
    end
  end
end
