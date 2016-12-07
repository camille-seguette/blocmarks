class LikesController < ApplicationController
  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)
    authorize like

    if like.save
      flash[:notice] = "Bookmark successfully liked."
<<<<<<< HEAD
    else
      flash[:alert] = "Failed to like this bookmark."
    end
    redirect_to @bookmark.topic
=======
      redirect_to :back
    else
      flash[:alert] = "Failed to like this bookmark."
      redirect_to :back
    end
>>>>>>> aee390eeefb3b79e45dd86f6f6cf043c7e913595
  end

  def destroy
    bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])
    authorize like

    if like.destroy
      flash[:notice] = "Bookmark unliked."
<<<<<<< HEAD
    else
      flash[:alert] = "Unliking failed."
    end
    redirect_to bookmark.topic
=======
      redirect_to :back
    else
      flash[:alert] = "Unliking failed."
      redirect_to :back
    end
>>>>>>> aee390eeefb3b79e45dd86f6f6cf043c7e913595
  end
end
