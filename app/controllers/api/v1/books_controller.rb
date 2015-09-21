class Api::V1::BooksController < ApplicationController

  before_filter :ensure_auth_key_present, except: [:index]
  before_filter :ensure_genuine_user, only: [:create, :update]

  def index
    render json: filter.filtered, each_serializer: BookSerializer, root: false
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
    if book.update_attributes(book_params)
      render json: { updated: true }
    else
      render json: { updated: false }, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def book
    @book ||= Book.where(id: params[:id]).first
  end

  def filter
    return @filter if @filter.present?

    user =
      if auth_key.present? && params[:user_id]
        current_auth_user
      end

    @filter = Filter::Books.new(user, params)
  end

  def book_params
    params.require(:book).permit(
      :title,
      :author,
      :isbn,
      :auctioning_enable,
      :show_offers,
      :accept_offers,
      :user_id,
      tags: []
    )
  end

  def media_params
    params.require(:book_cover).permit(:id)
  end

  def media
    @media ||= Media::BookCover.find(media_params[:id])
  end

end
