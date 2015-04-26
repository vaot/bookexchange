class Media::ProfilePicture < Media
  has_attached_file :attachment,
    :styles => { :small => '100x100>', :large => '200x200>' }

  validates_attachment_content_type :attachment,
    :content_type => %w(image/jpg image/jpeg image/png image/gif)
end
