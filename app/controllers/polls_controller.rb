class PollsController < ApplicationController
  # 略
  def show
    @poll = Poll.find(params[:id])
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

  # 略

  # ***** 以下を追加 *****
  private

  def poll_params
    params.require(:poll).permit(:title, :content)
  end
  # ***** 以上を追加 *****
end
