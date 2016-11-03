require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do
  context "user" do
    before do
      @user = FactoryGirl.create(:user)
      sign_in @user
      @bookmark = Bookmark.create!(title: Faker::Lorem.word, user: @user)
    end

    describe "GET #show" do
      it "returns http success" do
        get :show, {id: @bookmark.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do
        get :show, {id: @bookmark.id}
        expect(response).to render_template :show
      end

      it "assigns my_bookmark to @bookmark" do
        get :show, {id: @bookmark.id}
        expect(assigns(:bookmark)).to eq(@bookmark)
      end
    end

    describe "GET #new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end
    end

    describe "DELETE destroy" do
      it "returns http redirect" do
        delete :destroy, topic_id: my_topic.id, id: my_bookmark.id
        expect(response).to redirect_to(new_session_path)
      end
    end
  end

  context "non-user" do
    before do
      @user = FactoryGirl.create(:user)
      @bookmark = FactoryGirl.create(:bookmark)
    end

    describe "GET #show" do
      it "redirects to log in" do
        get :show, {id: @bookmark.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "GET #new" do
      it "redirects to log in" do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "DELETE destroy" do
      it "returns http redirect" do
        delete :destroy, topic_id: my_topic.id, id: my_bookmark.id
        expect(response).to redirect_to(new_session_path)
      end
    end
  end
end
