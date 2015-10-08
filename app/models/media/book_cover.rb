class Media::BookCover < Media
  has_attached_file :attachment,
    styles: {
      small: '120x160',
      medium: '200x300',
      large: '1000x1000>'
    }

  validates_attachment_content_type :attachment,
    :content_type => %w(image/jpg image/jpeg image/png image/gif)

  after_commit :get_dominant_color, on: :create

  def hex_dominant_color
    dominant_color || get_dominant_color
  end
end
