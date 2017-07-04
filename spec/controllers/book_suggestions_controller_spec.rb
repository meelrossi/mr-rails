require 'rails_helper'

describe BookSuggestionsController do
  describe 'POST #create' do
    let(:book) { create(:book_suggestion) }
    subject { post :create, params: params }

    context 'with correct params' do
      let(:params) { { link: book.link, author: book.author, title: book.title } }
      before { subject }
      it 'responds with created' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with missing author' do
      let(:params) { { link: book.link, title: book.title } }
      before { subject }
      it 'responds with bad request' do
        expect(response).to have_http_status(:bad_request)
      end
    end

    context 'with missing link' do
      let(:params) { { author: book.author, title: book.title } }
      before { subject }
      it 'responds with bad request' do
        expect(response).to have_http_status(:bad_request)
      end
    end

    context 'with missing title' do
      let(:params) { { link: book.link, author: book.author } }
      before { subject }
      it 'responds with bad request' do
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
