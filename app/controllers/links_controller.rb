class LinksController < ApplicationController
  def index
    @link = Link.new
    if current_user
      @links = current_user.links
    else
      @links = []
    end
  end

  def create
    @link = current_user.links.new(link_params)

    if @link.save
      redirect_to links_path
    else
      flash[:error] = "Invalid link"
      redirect_to links_path
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
