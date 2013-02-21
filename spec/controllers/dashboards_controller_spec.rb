require 'spec_helper'

describe DashboardsController do
	login_user

  describe "Get index" do
    it "should return current user dashboard page" do
      get(:index)
      response.should be_success
    end

    it "render the index template" do
			get "index"
			response.should render_template("index")
		end
  end
end