class BidSerializer < ActiveModel::Serializer
  attributes :id, :price, :created_at, :user_key

  def user_key
    current_user = serialization_options[:current_user]

    if current_user.present? && current_user == object.user
      "(me)"
    else
      object.user.generate_bid_key
    end
  end
end
