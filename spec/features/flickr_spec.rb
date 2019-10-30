require 'rails_helper'

RSpec.feature "Flickr API", type: :feature do
  before do
    @valid_id = "184892710@N03"
    @photo1 = "https://farm66.staticflickr.com/65535/48981179066_785d1fe985_q.jpg"
  end

  describe "Flickr user id search" do
    scenario "when valid user id submitted" do
      VCR.use_cassette("correct_user_id_search") do
        visit root_path
        fill_in "search_id", with: @valid_id
        click_button "Search User Photos By ID"
      end
      VCR.use_cassette("correct photo") do
        expect(page).to have_css("img[src*='#{@photo1}']")
      end
    end
  end
end