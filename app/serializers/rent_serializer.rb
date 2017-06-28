class RentSerializer < ActiveModel::Serializer
  attributes :id, :book_id, :user_id, :from, :to
end
