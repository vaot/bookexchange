class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :isbn, :cover_url, :accept_offers,
             :show_offers, :tags, :user_id, :description, :dominant_color

  def cover_url
    {
      small:  object.cover.try(:attachment, :small) || object.cover_url,
      medium: object.cover.try(:attachment, :medium) || object.cover_url
    }
  end

  def dominant_color
    object.cover.try(:hex_dominant_color)
  end
end
