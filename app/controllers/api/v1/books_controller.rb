class Api::V1::BooksController < ApplicationController
  respond_to :json

  def index
    respond_with Book.all, each_serializer: BookSerializer, root: false
  end

  def create
    @book = Book.create(book_params)
    if @book.valid?
      respond_with @book, serializer: BookSerializer
    else
      respond_with status: :bad_request
    end
  end

  def update
  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :isbn)
  end
end
