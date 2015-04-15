require 'rails_helper'

RSpec.describe "User creates new article" do
  context "with all title and body filled in" do
    it "saves article and displays article title and body" do
      visit new_article_path
      fill_in "article[title]", with: "New Article"
      fill_in "article[body]", with: "Body of new Article"
      save_and_open_page
      click_button "Create New Article"
      expect(page).to have_content("New Article")
      expect(page).to have_content("Body of new Article")
    end
  end
  context "with title, but no body" do
    it "does not save the new article," do
      visit new_article_path
      fill_in "article[title]", with: "New Article1"
      click_button "Create New Article"
      expect(current_path).to be(new_article_path)
    end
  end
  context "with body, but no title" do
    it "does not save the new article," do
      visit new_article_path
      fill_in "article[body]", with: "Body of new Article1"
      click_button "Create New Article"
      expect(current_path).to be(new_article_path)
    end
  end
end
