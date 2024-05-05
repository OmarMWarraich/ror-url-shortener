class LinksController < ApplicationController
  before_action :set_link,  only: [:show]
  def index
    @links = Link.recent_first
  end

  def show

  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to links_path
    else
      index
      render :index, status: :unprocessable_entity
    end
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end

  def set_link
    @link = Link.find(params[:id])
  end
end
