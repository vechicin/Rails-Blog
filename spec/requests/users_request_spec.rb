require 'rails_helper'
require 'rails-controller-testing'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:example) { get users_path }

    it 'successfully loads the page' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template(:index)
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('This should be a page that displays a list of all users')
    end
  end

  describe 'GET #show' do
    before(:example) { get '/users/:user_id' }
    it 'successfully loads the page' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'show' template" do
      expect(response).to render_template(:show)
    end
    it 'response body includes correct placeholder text' do
      expect(response.body).to include("This should be a page where you can see each individual user's profile")
    end
  end
end