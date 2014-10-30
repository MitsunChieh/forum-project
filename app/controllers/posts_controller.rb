class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic, :only => [ :show, :edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user

    if @topic.save
      redirect_to posts_url
    else
      render :action => :new
    end
  end

  def show
    @reply = Reply.new
  end

  def edit
  end

  def update
    @topic.attributes = topic_params
    @topic.save
    redirect_to post_url(@topic)
  end

  def destroy
    @topic.destroy
    redirect_to posts_url
  end

  end
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:name, :content, :category_id, :user_id)
  end

end
