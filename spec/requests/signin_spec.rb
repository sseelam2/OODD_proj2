require 'rails_helper'

RSpec.describe "Signin", type: :request do
  describe "GET /signin" do
    it "works! (Able to reach the sign in page)" do
      get '/signin#index'
      expect(response).to have_http_status(200)
    end
  end
end
