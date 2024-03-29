class Api::V1::MediasController < Api::V1::ApiController

  def create
    @media = Media::BookCover.create(media_params)
    render json: {
      id: @media.id
    }
  end

  def update
  end

  def destroy
  end

  def media_params
    params.permit(:attachment)
  end
end
