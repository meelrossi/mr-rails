class BooksController < ApplicationController
  def index
    books = paginate(Book)
    render json: books, status: 200
  end

  def show
    book = Book.find_by(id: params[:id])
    render json: book, status: 200
  end
end
