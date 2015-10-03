class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :isbn, :cover_url, :accept_offers,
             :show_offers, :tags, :user_id

  def cover_url
    if object.cover
      {
        small: object.cover.attachment(:small),
        medium: object.cover.attachment(:medium)
      }
    end
  end
end
