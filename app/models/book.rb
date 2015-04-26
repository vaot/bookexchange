class Book < ActiveRecord::Base
  has_one :cover, dependent:  :destroy, as: :owner, class_name: "Media::BookCover"
end
