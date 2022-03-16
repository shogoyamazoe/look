require 'rails_helper'

RSpec.describe "SentItems", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/sent_items/index"
      expect(response).to have_http_status(:success)
    end
  end

end
