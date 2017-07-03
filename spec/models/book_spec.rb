require 'rails_helper'

describe Book do
  it 'genre should be present' do
    should validate_presence_of(:genre)
  end

  it 'author should be present' do
    should validate_presence_of(:author)
  end

  it 'image should be present' do
    should validate_presence_of(:image)
  end

  it 'title should be present' do
    should validate_presence_of(:title)
  end

  it 'publisher should be present' do
    should validate_presence_of(:publisher)
  end

  it 'year should be present' do
    should validate_presence_of(:year)
  end
end
