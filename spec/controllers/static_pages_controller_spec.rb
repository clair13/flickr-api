require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
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
end