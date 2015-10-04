class CoverUrlDownloadJob
  include Sidekiq::Worker

  sidekiq_options queue: :low

  def perform(book_id, cover_url)
    Book.find(book_id).cover = Media::BookCover.new(attachment_remote_url: cover_url)
  end
end
