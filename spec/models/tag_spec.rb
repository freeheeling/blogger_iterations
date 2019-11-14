require 'rails_helper'

describe Tag, type: :model do
  describe 'relationships' do
    it {should have_many(:taggings)}
    it {should have_many(:articles).through(:taggings)}
  end

  describe 'instance methods' do
    describe 'to_s' do
      it 'returns the name of the tag' do
        tag = Tag.create(name: 'Name')

        expect(tag.to_s).to eq('Name')
      end
    end
  end
end
