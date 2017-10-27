class AlbumsController < ApplicationController
  def index
    @albums = Album.all
    render :index
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def new
    @bands = Band.all
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to new_album_url
    end
  end

  def edit
    @bands = Band.all
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to edit_album_url(@album)
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.delete
    redirect_to albums_url
  end

  private

  def album_params
    params.require(:album).permit(:title, :year, :studio?, :band_id)
  end
end