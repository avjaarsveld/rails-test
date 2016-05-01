require 'rails_helper'

describe SalesController do
  describe "routes for Sales" do
    it "routes get /sales/:id to the sales controller, show action with id" do
      expect(get("/sales/1")).to route_to("sales#show", :id => "1")
    end

    it "routes post /sales to the sales controller, create action" do
      expect(post("/sales")).to route_to("sales#create")
    end

    it "routes delete /sales/1 to the sales controller, destroy action with id" do
      expect(delete("/sales/1")).to route_to("sales#destroy", :id => "1")
    end
  end
end