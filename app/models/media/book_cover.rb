class Media::BookCover < Media
  has_attached_file :attachment,
    :styles => { :small => 'x100', :large => '1000x1000>' }

  validates_attachment_content_type :attachment,
    :content_type => %w(image/jpg image/jpeg image/png image/gif)
end
