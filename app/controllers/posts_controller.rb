class PostsController < ApplicationController

  def index
    @topics = Topic.all
  end

end
