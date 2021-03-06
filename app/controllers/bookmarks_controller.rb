class BookmarksController < ApplicationController
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(bookmark_params)
    @bookmark.user = current_user
    #authorize @bookmark

    if @bookmark.save
      flash[:notice] = "Bookmark was saved successfully."
      redirect_to @topic
    else
      flash.now[:alert] = "Error creating bookmark. Please try again."
      redirect_to @topic
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    @bookmark.assign_attributes(bookmark_params)
    #authorize @bookmark

    if @bookmark.save
      flash[:notice] = "Bookmark was updated successfully."
      redirect_to topic_path(@topic)
    else
      flash.now[:alert] = "There was an error saving the bookmark. Please try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    #authorize @bookmark

    if @bookmark.destroy
      flash[:notice] = "\"#{@bookmark.url}\" was deleted successfully."
      redirect_to topic_path(@topic)
    else
      flash.now[:alert] = "There was an error deleting the bookmark."
      redirect_to topic_path(@topic)
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end

  def user_not_authorized
    flash[:alert] = "You must be an owner or an admin to do that."
    redirect_to root_path
  end
end
