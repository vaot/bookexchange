class Api::V1::SearchController < Api::V1::ApiController

  def search
    render json: Book.search(params[:query]).records.to_a, each_serializer: BookSerializer
  end

end
