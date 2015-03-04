class Book < ActiveRecord::Base
  acts_as_taggable
  has_one :cover, dependent:  :destroy, as: :owner, class_name: "Media::BookCover"
end

%w(book_cover).each do |r|
  require_dependency "media/#{r}"
end
