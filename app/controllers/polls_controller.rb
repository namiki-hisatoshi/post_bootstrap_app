class PostsController < ApplicationController
  # 略

  def new
  # ***** 以下を追加 *****
    @post = Post.new
  # ***** 以上を追加 *****
  end

  def create
  # ***** 以下を追加 *****
    post = Post.create!(post_params)
    redirect_to post
  # ***** 以上を追加 *****
  end

  # 略

  # ***** 以下を追加 *****
  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
  # ***** 以上を追加 *****
end
