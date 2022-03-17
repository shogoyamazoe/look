require 'rails_helper'

RSpec.describe "GivePersons", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/give_persons/index"
      expect(response).to have_http_status(:success)
    end
  end

end
