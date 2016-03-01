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

  def update
    @link = current_user.links.find(params[:id])

    if @link.update(link_params)
      redirect_to links_path
    else
      flash[:error] = "Invalid update"
      redirect_to edit_link_path(@link)
    end
  end

  def edit
    @link = current_user.links.find(params[:id])
  end

  private

  def link_params
    params.require(:link).permit(:title, :url, :read)
  end
end
