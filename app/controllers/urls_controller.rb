class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def show
    @url ||= Url.find(params[:id])
  end

  def visit
    @url = Url.find_by(slug: params[:slug])
    redirect_to @url.fullUrl, allow_other_host: true
  end

  def create
    @url = Url.new(url_params)
    @url.slug ||=  SecureRandom.hex(8)

    if @url.save
      render :show, notice: 'Saved!'
    else
      render :new, status: :unprocessable_entity
    end
    
  end

  def edit
    @url = Url.find(params[:id])
  end

  def update
    @url = Url.find(params[:id])
    if @url.update(url_params)
      render :show, notice: 'Updated!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def url_params
    params.require(:url).permit(:name, :fullUrl, :slug)
  end
end
