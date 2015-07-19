require 'rails_helper'

RSpec.describe AtterecoBack::V1::Schedules, type: :request do
  include_context 'api'

  describe 'GET /api/v1/schedules' do
    let(:url) { '/api/v1/schedules' }
    let(:method) { 'get' }
    let(:parameters) do
      {
        token: ENV['API_TOKEN']
      }
    end
    context 'exist schedules' do
      before do
        create(:schedule, id: 1, scheduled_date: Date.today)
        create(:schedule, caption: 'ハッカソン', id: 2, scheduled_date: Date.today)
      end
      let(:result) do
        {
          '1' => [
            {
              'caption' => '定例活動',
              'start_at' => '2015-07-17T19:00:00.000+09:00',
              'end_at' => '2015-07-17T21:00:00.000+09:00'
            }
          ],
          '2' => [
            {
              'caption' => 'ハッカソン',
              'start_at' => '2015-07-17T19:00:00.000+09:00',
              'end_at' => '2015-07-17T21:00:00.000+09:00'
            }
          ]
        }
      end
      it_behaves_like '200 Success'
    end

    context 'does not exist schedules' do
      before do
        create(:schedule, id: 1, scheduled_date: '2014-07-17')
        create(:schedule, caption: 'ハッカソン', id: 2, scheduled_date: '2014-07-17')
      end
      it_behaves_like '404 Not Found'
    end
  end
end
