class Book < ApplicationRecord
  validates :genre, :author, :image, :title, :publisher, :year, presence: true

  def image
    { url: self[:image] }
  end
end
