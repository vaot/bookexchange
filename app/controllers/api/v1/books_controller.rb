class Api::V1::BooksController < ApplicationController

  def index
    render json: Book.all, each_serializer: BookSerializer, root: false
  end

  def create
    @book = Book.new(book_params)
    @book.cover = media

    if @book.save
      render json: @book, serializer: BookSerializer
    else
      render status: :bad_request
    end
  end

  def show
    render json: book, serializer: BookSerializer
  end

  def update
  end

  def destroy
  end

  private

  def book
    @book ||= Book.where(id: params[:id]).first
  end

  def book_params
    params.require(:book).permit(
      :title,
      :author,
      :isbn,
      :auctioning_enable,
      :show_offers,
      :accept_offers
    )
  end

  def media_params
    params.require(:book_cover).permit(:id)
  end

  def media
    @media ||= Media::BookCover.find(media_params[:id])
  end

end
