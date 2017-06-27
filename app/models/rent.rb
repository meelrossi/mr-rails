class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book
  include Paginatable
end
