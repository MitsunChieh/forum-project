class PostRepliesController < ApplicationController
  before_action :find_topic
  before_action :authenticate_user!

  # def new
  #   @reply = @topic.replies.build
  # end

  def create
    @reply = @topic.replies.build(reply_params)
    @reply.user = current_user
    @reply.save
    @topic.reply_counter += 1
    @topic.save
    redirect_to post_url(@topic)
  end

  private

  def reply_params
    params.require(:reply).permit(:content)
  end

  def find_topic
    @topic = Topic.find(params[:post_id])
  end

end
