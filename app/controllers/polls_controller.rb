class PollsController < ApplicationController
  # 略
  def index
    @polls = Poll.order(id: :asc)
  end

  def show
    @poll = Poll.find(params[:id])
  end

  def edit
    @poll = Poll.find(params[:id])
  end

  def update
    poll = Poll.find(params[:id])
    poll.update!(poll_params)
    redirect_to poll
  end


  def new
  # ***** 以下を追加 *****
    @poll = Poll.new
  # ***** 以上を追加 *****
  end

  def create
  # ***** 以下を追加 *****
    poll = Poll.create!(poll_params)
    redirect_to poll
  # ***** 以上を追加 *****
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy!
    redirect_to root_path
  end

  # ***** 以下を追加 *****
  private

  def poll_params
    params.require(:poll).permit(:title, :content)
  end
  # ***** 以上を追加 *****
end
