require "rails_helper"

RSpec.describe JinglesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/jingles").to route_to("jingles#index")
    end

    it "routes to #new" do
      expect(:get => "/jingles/new").to route_to("jingles#new")
    end

    it "routes to #show" do
      expect(:get => "/jingles/1").to route_to("jingles#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/jingles/1/edit").to route_to("jingles#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/jingles").to route_to("jingles#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/jingles/1").to route_to("jingles#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/jingles/1").to route_to("jingles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/jingles/1").to route_to("jingles#destroy", :id => "1")
    end

  end
end
