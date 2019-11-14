require 'rails_helper'

describe 'user sees one tag' do
  describe 'they link from an article show' do
    it 'displays a tag\'s info' do
      article = Article.create!(title: 'New Title', body: 'New Body')
      tag = article.tags.create(name: 'Name')

      visit article_path(article)

      click_link 'Name'

      expect(current_path).to eq(tag_path(tag))
      expect(page).to have_content('Name')
    end
  end
end
