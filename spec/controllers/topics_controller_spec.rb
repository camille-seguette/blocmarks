require 'rails_helper'

RSpec.describe TopicsController, type: :controller do

  context "user" do
    before do
      @user = FactoryGirl.create(:user)
      sign_in @user
      @topic = Topic.create!(title: Faker::Lorem.word, user: @user)
    end

    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #show" do
      it "returns http success" do
        get :show, {id: @topic.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do
        get :show, {id: @topic.id}
        expect(response).to render_template :show
      end

      it "assigns my_topic to @topic" do
        get :show, {id: @topic.id}
        expect(assigns(:topic)).to eq(@topic)
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

    describe "POST create" do
      it "increases the number of topics by 1" do
        expect{ post :create, {topic: {title: Faker::Lorem.word}}}.to change(Topic,:count).by(1)
      end

      it "redirect to the new topic" do
        post :create, {topic: {title: Faker::Lorem.word}}
        expect(response).to redirect_to Topic.last
      end
    end
  end

  context "non-user" do
    before do
      @user = FactoryGirl.create(:user)
      @topic = FactoryGirl.create(:topic)
    end

    describe "GET #index" do
      it "redirect to log in" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "GET #show" do
      it "redirects to log in" do
        get :show, {id: @topic.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "GET #new" do
      it "redirects to log in" do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
