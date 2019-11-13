require 'rails_helper'

describe 'user edits an article' do
  describe 'they link from an article show page' do
    describe 'they modify the title and/or body' do
      it 'displays the updated information on the article show page' do
        article = Article.create!(title: 'Title 1', body: 'Body 1')

        visit article_path(article)

        click_link 'Edit'

        fill_in 'article[title]', with: 'Updated Title!'

        click_on 'Update Article'

        expect(current_path).to eq(article_path(article))

        expect(page).to have_content('Updated Title!')
        expect(page).to have_content(article.body)
        expect(page).to_not have_content(article.title)
        expect(page).to have_content("Article 'Updated Title!' was updated!")
      end
    end
  end
end
