require 'rails_helper'

RSpec.describe "SentReturns", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/sent_returns/index"
      expect(response).to have_http_status(:success)
    end
  end

end
