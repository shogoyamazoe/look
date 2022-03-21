require 'rails_helper'

RSpec.describe "GiveReturns", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/give_returns/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/give_returns/new"
      expect(response).to have_http_status(:success)
    end
  end

end
