class DominantColorJob
  include Sidekiq::Worker

  sidekiq_options queue: :low

  def perform(media_id)
    media = Media.find(media_id)
    image = MiniMagick::Image.open(media.attachment.url)
    dominant_color = image.get_dominant_color

    if dominant_color.present?
      media.update_attributes(dominant_color: dominant_color)
    end
  end
end
