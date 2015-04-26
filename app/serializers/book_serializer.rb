class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :isbn, :cover_url

  def cover_url
    if object.cover
      object.cover.attachment(:small)
    end
  end
end
