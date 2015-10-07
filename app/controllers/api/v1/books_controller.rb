class Api::V1::BooksController < Api::V1::ApiController

  before_filter :ensure_auth_key_present, except: [:show, :index]
  before_filter :ensure_genuine_user, only: [:create, :update]

  def index
    render json: filter.filtered, each_serializer: BookSerializer, root: false
  end

  def create
    @book = Book.new(book_params)

    if params[:book_cover].present?
      @book.cover = media
    elsif params[:cover_url].present?
      @book.cover_url = params[:cover_url][:medium]
    end

    if @book.save
      render json: @book, serializer: BookSerializer
    else
      render_errors(notification)
    end
  end

  def show
    render json: book, serializer: BookSerializer
  end

  def update
    if book.update_attributes(book_params)
      render_json_success
    else
      render_json_error
    end
  end

  def destroy
    if book.destroy
      render_json_success
    else
      render_json_error
    end
  end

  private

  def book
    @book ||= Book.find(params[:id])
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
      :show_offers,
      :accept_offers,
      :user_id,
      :description,
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
