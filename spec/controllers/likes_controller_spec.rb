require 'rails_helper'

RSpec.describe LikesController, type: :controller do
<<<<<<< HEAD

  before do
    @user = FactoryGirl.create(:user)
    sign_in @user
    @topic = FactoryGirl.create(:topic)
    @bookmark = FactoryGirl.create(:bookmark, topic_id: @topic.id)
  end

  it 'creates a like for the current user and specified bookmark' do
    expect(@user.likes.find_by_bookmark_id(@bookmark_id)).to be_nil
    post :create, { bookmark_id: @bookmark.id }
    expect(@user.likes.find_by_bookmark_id(@bookmark.id)).not_to be_nil
  end

  it "deletes the like from the database" do
    like = @user.likes.where(bookmark: @bookmark).create
    expect( @user.likes.find_by_bookmark_id(@bookmark.id)).not_to be_nil
    delete :destroy, { bookmark_id: @bookmark.id, id: like.id }
    expect( @user.likes.find_by_bookmark_id(@bookmark.id)).to be_nil
=======
  describe 'POST #create' do
    context "with valid attributes" do
      it "saves the new like in the database"
      it "redirects to bookmarks#show"
    end
  end

  describe 'DELETE #destroy' do
    it "deletes the like from the database"
    it "redirects to bookmarks#index"
>>>>>>> aee390eeefb3b79e45dd86f6f6cf043c7e913595
  end
end
