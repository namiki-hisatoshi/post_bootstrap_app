class PollsController < ApplicationController
  before_action :set_poll, only: %i[show edit update destroy]
  # 略
  def index
    @polls = Poll.order(id: :asc)
  end

  def show

  end

  def edit

  end

  def update
    @poll.update!(poll_params)
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
    @poll.destroy!
    redirect_to root_path
  end

  def set_poll
    @poll = Poll.find(params[:id])

  # ***** 以下を追加 *****
  private

  def poll_params
    params.require(:poll).permit(:title, :content)
  end
  # ***** 以上を追加 *****
end
