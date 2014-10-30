class PostsController < ApplicationController
  before_action :authenticate_user!

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
    @topic = Topic.find(params[:id])
    @reply = Reply.new
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :content, :category_id, :user_id)
  end

end
