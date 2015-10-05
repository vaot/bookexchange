class Media::ProfilePicture < Media
  has_attached_file :attachment,
    :styles => { :small => '100x100>', :large => '200x200>' }

  validates_attachment_content_type :attachment,
    :content_type => %w(image/jpg image/jpeg image/png image/gif)

  after_create :get_dominant_color

  def hex_dominant_color
    dominant_color || get_dominant_color
  end
end
