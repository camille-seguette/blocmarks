class IncomingController < ApplicationController
  def create
  @user = User.find_by(email: params[:sender])

  if @user.nil?
    @user = User.create(email: params[:sender], password: "junk")
    @user.save
  end

  @topic = Topic.find_or_create_by(title: params[:subject], user_id: @user.id)

  @bookmark = @topic.bookmarks.find_or_create_by(url: params["body-plain"])

  head 200
  end
end
