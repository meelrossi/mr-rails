class BooksController < ApplicationController
  def index
    json = paginate(Book)
    render json: json, status: 200
  end

  def show
    book = Book.find_by(id: params[:id])
    render json: book, status: 200
  end
end
