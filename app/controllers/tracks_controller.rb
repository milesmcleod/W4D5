class TracksController < ApplicationController

  before_action :require_logged_in
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def new
    @bands = Band.all
    @albums = Album.all
    render :new
  end

  def create
    @albums = Album.all
    @track = Track.new(track_params)
    if @track.save
      redirect_to album_url(@track.album_id)
    else
      flash[:errors] = @track.errors.full_messages
      redirect_to new_track_url
    end
  end

  def edit
    @track = Track.find(params[:id])
    @bands = Band.all
    @albums = Album.all
    render :edit
  end

  def update
    @albums = Album.all
    @track = Track.find(params[:id])
    if @track.update_attributes(track_params)
      redirect_to album_url(@track.album_id)
    else
      flash[:errors] = @track.errors.full_messages
      redirect_to edit_track_url(@track)
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.delete
    redirect_to album_url(@track.album_id)
  end

  private

  def track_params
    params.require(:track).permit(:title, :album_id, :ord, :lyrics, :bonus?)
  end

end
