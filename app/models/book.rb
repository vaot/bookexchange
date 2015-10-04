class Book < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_one :cover, dependent:  :destroy, as: :owner, class_name: "Media::BookCover"
  belongs_to :user

  has_many :bids, as: :owner

  serialize :tags, Array

  after_update :update_tags, if: -> { tags_changed? }

  VISIBILITY_TYPES = {
    public: 'public'
  }

  scope :public_visible, -> { where(visibility: VISIBILITY_TYPES[:public]) }
  scope :recent, -> { order("created_at DESC") }

  def self.scope_by_tags(tags)
    self.where(id: FastTagging::Books.retrieve(tags))
  end

  def update_tags
    service = FastTagging::Books.new(self)
    service.remove(tags_was)
    service.add(tags)
  end

  def as_indexed_json(options = {})
    self.as_json(
      only: %i(title author isbn tags)
    )
  end
end
