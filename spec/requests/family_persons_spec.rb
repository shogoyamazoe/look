require 'rails_helper'

RSpec.describe "FamilyPersons", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/family_persons/index"
      expect(response).to have_http_status(:success)
    end
  end

end
