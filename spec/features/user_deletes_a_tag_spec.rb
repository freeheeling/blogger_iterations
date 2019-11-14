require 'rails_helper'

describe 'user deletes a tag' do
  describe 'they link from the tag show page' do
    it 'displays all tags without the deleted entry' do
      article_1 = Article.create!(title: 'Title 1', body: 'Body 1')
      article_2 = Article.create!(title: 'Title 2', body: 'Body 2')
      tag_1 = article_1.tags.create(name: 'Tag 1')
      tag_2 = article_2.tags.create(name: 'Tag 2')

      visit tag_path(tag_1)

      click_link 'Delete Tag'

      expect(current_path).to eq(tags_path)

      expect(page).to have_content(tag_2.name)
      expect(page).to have_content("Tag 'Tag 1' was deleted!")
    end
  end
end
