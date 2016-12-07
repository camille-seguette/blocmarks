require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do
  context "user" do
    before do
      @user = FactoryGirl.create(:user)
      sign_in @user
      @topic = FactoryGirl.create(:topic)
      @bookmark = FactoryGirl.create(:bookmark, user_id: @user.id)
    end

    describe "GET #new" do
      it "returns http success" do
        get :new, {topic_id: @topic.id, id: @bookmark.id, user_id: @user.id}
        expect(response).to have_http_status(:success)
      end
    end

    describe "POST create" do
<<<<<<< HEAD
      it "creates a like for the current user and current bookmark" do
        expect(@user.likes.find_by_bookmark_id(@bookmark_id)).to be_nil
        post :create, topic_id: @topic.id, user_id: @user.id, bookmark: { url: Faker::Internet.url }
=======
      it 'creates a like for the current user and specified bookmark' do
        expect(@user.likes.find_by_bookmark_id(@bookmark_id)).to be_nil
        post :create, { bookmark_id: @bookmark.id }
        expect(@user.likes.find_by_bookmark_id(@bookmark_id)).not_to be_nil
>>>>>>> aee390eeefb3b79e45dd86f6f6cf043c7e913595
      end
    end

    describe "GET #edit" do
      it "returns http redirect" do
        get :edit, topic_id: @topic.id, id: @bookmark.id
        expect(response).to have_http_status(:success)
      end
    end

    describe "PUT update" do
      it "returns the correct title" do
        new_bookmark = "Updated bookmark"
        put :update, topic_id: @topic.id, id: @bookmark.id, user_id: @user.id, bookmark: { url: new_bookmark }
        updated_bookmark = assigns(:bookmark)
        expect(updated_bookmark.url).to eq(new_bookmark)
      end
    end

    describe "DELETE destroy" do
      it "deletes the bookmark" do
        delete :destroy, topic_id: @topic.id, user_id: @user.id, id: @bookmark.id
        count = Bookmark.where({id: @bookmark.id}).size
        expect(count).to eq 0
      end
    end
  end
end
