require 'rails_helper'

describe AuthenticationController do
  describe 'POST #create' do
    let(:user) { create(:user) }
    subject { post :create, params: { session: session_params } }

    context 'with invalid password' do
      let(:session_params) { { email: user.email, password: '00000000' } }
      before { subject }
      it 'responds with unauthorized' do
        expect(response).to have_http_status(:unauthorized)
      end
      it 'responds a message pointing out that the credentials are incorrect' do
        expect(response_body['error']).to eq('Invalid authentication credentials')
      end
    end

    context 'with invalid email' do
      let(:session_params) { { email: 'atest@test.com', password: user.password } }
      before { subject }
      it 'responds with unauthorized' do
        expect(response).to have_http_status(:unauthorized)
      end
      it 'responds a message pointing out that the credentials are incorrect' do
        expect(response_body['error']).to eq('Invalid authentication credentials')
      end
    end

    context 'with valid email and password' do
      let(:session_params) { { email: user.email, password: user.password } }
      before { subject }
      it 'responds with ok' do
        expect(response).to have_http_status(:ok)
      end
      it 'returns the access_token' do
        expect(response_body['access_token']).to be_present
      end
      it 'returns the renew_id' do
        expect(response_body['renew_id']).to be_present
      end
    end
  end

  describe 'POST #renew' do
    context 'when the session was created' do
      include_context 'Authenticated User' do
        let(:renew_params) { { renew_id: renew_id } }
      end
      context 'when the authentication token can be renewed' do
        before do
          time = Time.zone.now.tomorrow
          Timecop.freeze(time.year, time.month, time.day, time.hour, time.min, time.sec)
          post :renew, params: { session: renew_params }
        end
        after do
          Timecop.return
        end
        it 'responds with ok' do
          expect(response).to have_http_status(:ok)
        end
        it 'returns the access_token' do
          expect(response_body['access_token']).to be_present
        end
      end
    end
  end

  describe 'POST #invalidate_all' do
    include_context 'Authenticated User' do
      let(:renew_params) { { renew_id: renew_id } }
    end

    let(:trackable_value) { user.trackable_value }

    context 'when the authentication token is valid' do
      before do
        post :invalidate_all
      end
      it 'responds with ok' do
        expect(response).to have_http_status(:ok)
        expect(user.trackable_value).not_to eq(:trackable_value)
      end
    end

    context 'when the authentication token has expired' do
      before do
        Timecop.travel(Time.zone.now + 3.days)
        post :invalidate_all
      end
      after do
        Timecop.return
      end
      it 'responds with unauthorized' do
        expect(response).to have_http_status(:unauthorized)
      end
      it 'returns error message Expired token' do
        expect(response_body['error']).to match('Expired token')
      end
    end
  end
end
