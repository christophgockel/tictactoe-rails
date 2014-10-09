require 'rails_helper'

describe HomeController do
  it "renders the index template" do
    get :index

    expect(response).to render_template "home/index"
  end
end
