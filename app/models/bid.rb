class Bid < ActiveRecord::Base
  belongs_to :owner, polymorphic: true
  belongs_to :user

  validates :user_id, presence: true
end
