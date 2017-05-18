require 'rails_helper'

describe Book do
  it 'genre should be present' do
    should validate_presence_of(:genre)
  end

  it 'genre should be present' do
    should validate_presence_of(:author)
  end

  it 'genre should be present' do
    should validate_presence_of(:image)
  end

  it 'genre should be present' do
    should validate_presence_of(:title)
  end

  it 'genre should be present' do
    should validate_presence_of(:publisher)
  end

  it 'genre should be present' do
    should validate_presence_of(:year)
  end
end
