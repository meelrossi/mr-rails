class BookSuggestionsController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  def create
    book_sug = BookSuggestion.create(book_suggestion_params)
    if book_sug.valid?
      head :created
    else
      render json: { error: 'Not able to create book suggestion' }, status: :bad_request
    end
  end

  private

  def book_suggestion_params
    params.permit(:editorial, :price, :author, :title, :link, :publisher, :year)
  end
end
