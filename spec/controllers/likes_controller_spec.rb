require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  describe 'POST #create' do
    context "with valid attributes" do
      it "saves the new like in the database"
      it "redirects to bookmarks#show"
    end
  end

  describe 'DELETE #destroy' do
    it "deletes the like from the database"
    it "redirects to bookmarks#index"
  end
end
