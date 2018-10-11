require "rails_helper"

RSpec.describe SigninController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/signin").to route_to("signin#index")
    end



  end
end
