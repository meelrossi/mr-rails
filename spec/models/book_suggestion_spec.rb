require 'rails_helper'

describe BookSuggestion do
  it 'author should be present' do
    should validate_presence_of(:author)
  end

  it 'title should be present' do
    should validate_presence_of(:title)
  end

  it 'link should be present' do
    should validate_presence_of(:link)
  end
end
