class BidSerializer < ActiveModel::Serializer
  attributes :id, :price, :created_at
end
