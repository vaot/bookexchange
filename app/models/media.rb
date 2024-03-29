class Media < ActiveRecord::Base
  belongs_to :owner, polymorphic: true

  def attachment_remote_url=(url_value)
    self.attachment = URI.parse(url_value)
    @attachement_remote_url = url_value
  end

  private

  def get_dominant_color
    DominantColorJob.perform_async(id)
  end
end

%w(book_cover profile_picture).each do |r|
  require_dependency "media/#{r}"
end
