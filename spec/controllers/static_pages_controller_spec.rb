require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  before do
    @valid_id = "184892710@N03"
  end

  describe "#home" do
    it "responds successfully" do
      get :home
      expect(response).to be_successful
    end

    it "responds with 200 http status" do
      get :home
      expect(response).to have_http_status "200"
    end
  end

  describe '#photos' do
    context "when valid Flickr id submitted" do
      it 'returns a 200 http response' do
        VCR.use_cassette('correct_flickr_id') do
          post :photos, params: { search: { id: @valid_id } }
          expect(response).to have_http_status "200"
        end
      end
    end
  end
end