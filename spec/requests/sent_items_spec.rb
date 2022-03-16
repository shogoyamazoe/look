require 'rails_helper'

RSpec.describe "SentItems", type: :request do
  describe "GET /index" do
    
    before do
      get sent_items_path
    end

    it "returns http success" do
      expect(response).to have_http_status "200"
    end
  end
end
