require "rails_helper"

feature "Flickr Search" do
  scenario "user search for a photo in the searchbox" do
    visit root_path
    
    fill_in "search_result_query", with: "Bikes"
    click_button "Search Now"

    expect(page).to have_css(".four.wide.column")
  end
end
