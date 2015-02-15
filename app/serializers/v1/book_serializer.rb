class V1::BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :isbn
end
