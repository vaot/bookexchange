class BidSerializer < ActiveModel::Serializer
  attributes :id, :price, :user

  def user
    {
      id: object.user.id,
      first_name: object.user.first_name
    }
  end
end
