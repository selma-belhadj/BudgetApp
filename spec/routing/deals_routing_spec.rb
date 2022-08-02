require "rails_helper"

RSpec.describe DealsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/deals").to route_to("deals#index")
    end

    it "routes to #new" do
      expect(get: "/deals/new").to route_to("deals#new")
    end

    it "routes to #show" do
      expect(get: "/deals/1").to route_to("deals#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/deals/1/edit").to route_to("deals#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/deals").to route_to("deals#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/deals/1").to route_to("deals#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/deals/1").to route_to("deals#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/deals/1").to route_to("deals#destroy", id: "1")
    end
  end
end
