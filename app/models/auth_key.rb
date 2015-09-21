class AuthKey < ActiveRecord::Base
  belongs_to :owner, polymorphic: true
  validates :expires_at, presence: true

  scope :active, -> { where("expires_at > ?", DateTime.now) }
end
