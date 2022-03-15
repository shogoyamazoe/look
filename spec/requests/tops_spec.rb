require 'rails_helper'

RSpec.describe "Tops", type: :request do
  describe "GET /index" do
    
    before do
      get root_path
    end
    
    it "returns http success" do
      expect(response).to have_http_status "200"
    end
  end
end
