class Api::V1::SearchController < Api::V1::ApiController

  skip_before_filter :ensure_auth_key_present

  def search
    render json: Book.search(params[:query]).records.to_a, each_serializer: BookSerializer
  end

end
