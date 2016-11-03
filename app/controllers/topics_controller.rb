class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
  end

  def new
    @topic = Topic.new
  end

  def create
    @user = current_user
    @topic = Topic.new(topic_params)
    @topic.user_id = @user.id

    if @topic.save
      flash[:notice] = "Topic was saved successfully."
      redirect_to @topic
    else
      flash.now[:alert] = "Error creating topic. Please try again."
      render :new
    end
  end

  def update
    @bookmarks = Topic.bookmarks.find(params[:id])
    @bookmarks = @topic.bookmarks
    @topic.bookmarks.assign_attributes(post_params)

    if @topic.bookmarks.save
      @topic.bookmarks.labels = Label.update_labels(params[:topic][:bookmark])
      flash[:notice] = "Bookmark was updated successfully."
      redirect_to [@topic.bookmarks, @topic]
    else
      flash.now[:alert] = "There was an error saving the bookmark. Please try again."
      render :edit
    end
  end

  def destroy
    @topic.bookmarks = Topic.find(params[:id])
    if @topic.bookmarks.destroy
      flash[:notice] = "Topic was successfully deleted."
      redirect_to topics_path
    else
      flash[:alert] = "Error deleting topic."
      render :show
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end
end
