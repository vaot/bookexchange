class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :isbn, :cover_url, :accept_offers,
             :show_offers, :auctioning_enable, :tags, :user_id

  def cover_url
    if object.cover
      object.cover.attachment(:small)
    end
  end
end
