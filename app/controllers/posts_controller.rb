class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic, :only => [ :show, :edit, :update, :destroy]

  def index
    if params[:order]
      raise "Hack!" unless ["reply_counter", "created_at"].include?(params[:order])

      @topics = Topic.order("#{params[:order]} #{params[:sort]}")
    else
      @topics = Topic.all
    end
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user
    @topic.reply_counter = 0

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

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:name, :content, :category_id, :user_id)
  end

end
