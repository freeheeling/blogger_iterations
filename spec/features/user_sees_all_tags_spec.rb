require 'rails_helper'

describe 'user sees all tags' do
  describe 'they visit /tags' do
    it 'displays all tags' do
      article_1 = Article.create!(title: 'Title 1', body: 'Body 1')
      article_2 = Article.create!(title: 'Title 2', body: 'Body 2')
      tag_1 = article_1.tags.create(name: 'Tag_1')
      tag_2 = article_2.tags.create(name: 'Tag_2')

      visit '/tags'

      expect(page).to have_link(tag_1.name)
      expect(page).to have_link(tag_2.name)
    end
  end
end
