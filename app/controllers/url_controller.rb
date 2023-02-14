class UrlController < ApplicationController
  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def show
  end

  def visit
    @url = Url.find_by(slug: params[:slug])
    puts @url
    redirect_to @url.fullUrl, allow_other_host: true
  end

  def create
    @url = Url.new(url_params)
    @url.slug ||=  SecureRandom.hex(8)

    if @url.save
      redirect_to @url.fullUrl, allow_other_host: true
    else
      render :new, status: :unprocessable_entity
    end
    
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def url_params
    params.require(:url).permit(:name, :fullUrl, :slug)
  end
end
