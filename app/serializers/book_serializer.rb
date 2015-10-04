class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :isbn, :cover_url, :accept_offers,
             :show_offers, :tags, :user_id, :description

  def cover_url
    {
      small:  object.cover.try(:attachment, :small) || object.cover_url,
      medium: object.cover.try(:attachment, :medium) || object.cover_url
    }
  end
end
