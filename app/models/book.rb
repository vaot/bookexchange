class Book < ActiveRecord::Base

  include SearchableBooks

  has_one :cover, dependent:  :destroy, as: :owner, class_name: "Media::BookCover"
  belongs_to :user

  has_many :bids, as: :owner

  serialize :tags, Array

  after_update :update_tags, if: -> { tags_changed? }
  after_create :download_cover_url, if: -> { cover_url.present? }

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

  def download_cover_url
    CoverUrlDownloadJob.perform_async(self.id, cover_url)
  end
end
