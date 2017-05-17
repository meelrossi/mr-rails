class BookSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :publisher, :image, :year, :genre, :created_at, :updated_at
end
