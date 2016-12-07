class LikesController < ApplicationController
  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)
    authorize like

    if like.save
      flash[:notice] = "Bookmark successfully liked."
      redirect_to :back
    else
      flash[:alert] = "Failed to like this bookmark."
      redirect_to :back
    end
  end

  def destroy
    bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])
    authorize like

    if like.destroy
      flash[:notice] = "Bookmark unliked."
      redirect_to :back
    else
      flash[:alert] = "Unliking failed."
      redirect_to :back
    end
  end
end
