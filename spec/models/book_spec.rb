require 'rails_helper'

describe Book, type: :model do
  subject(:book) do
    Book.new(
      author: author,
      genre: genre,
      title: title,
      publisher: publisher,
      image: image,
      year: year
    )
  end

  let(:author)            { Faker::Book.author }
  let(:genre)             { Faker::Book.genre }
  let(:title)             { Faker::Book.title }
  let(:publisher)         { Faker::Book.publisher }
  let(:image)             { 'image1.jpg' }
  let(:year)              { '2005' }

  describe '#create' do
    context 'When all the values are ok' do
      it 'should be valid' do
        is_expected.to be_valid
      end
    end

    context 'When the author is nil' do
      let(:author) { nil }
      it 'should be invalid' do
        is_expected.to be_invalid
      end
    end

    context 'When the genre is nil' do
      let(:genre) { nil }
      it 'should be invalid' do
        is_expected.to be_invalid
      end
    end

    context 'When the title is nil' do
      let(:title) { nil }
      it 'should be invalid' do
        is_expected.to be_invalid
      end
    end

    context 'When the publisher is nil' do
      let(:publisher) { nil }
      it 'should be invalid' do
        is_expected.to be_invalid
      end
    end

    context 'When the image is nil' do
      let(:image) { nil }
      it 'should be invalid' do
        is_expected.to be_invalid
      end
    end

    context 'When the year is nil' do
      let(:year) { nil }
      it 'should be invalid' do
        is_expected.to be_invalid
      end
    end
  end
end
