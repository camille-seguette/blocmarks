class LikesController < ApplicationController
  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)
    authorize like

    if like.save
      flash[:notice] = "Bookmark successfully liked."
    else
      flash[:alert] = "Failed to like this bookmark."
    end
    redirect_to @bookmark.topic
  end

  def destroy
    bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])
    authorize like

    if like.destroy
      flash[:notice] = "Bookmark unliked."
    else
      flash[:alert] = "Unliking failed."
    end
    redirect_to bookmark.topic
  end
end
