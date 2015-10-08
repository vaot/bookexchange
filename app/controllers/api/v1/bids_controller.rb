class Api::V1::BidsController < Api::V1::ApiController

  before_filter :ensure_auth_key_present, except: [:index]

  def index
    render json: book.bids.includes(:owner), each_serializer: BidSerializer, root: false
  end

  def create
    bid = book.bids.new(bid_params.merge(user_id: current_auth_user.id))
    if bid.save
      render json: bid, serializer: BidSerializer
    else
      render_error(bid)
    end
  end

  def update
  end

  def destroy
  end

  private

  def book
    @book ||= Book.where(id: params[:book_id]).first
  end

  def bid_params
    params.require(:bid).permit(
      :price
    )
  end

end
