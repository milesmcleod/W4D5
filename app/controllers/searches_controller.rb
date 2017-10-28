class SearchesController < ApplicationController

  def search
    if params[:search][:category] == 'bands'
      flash[:searchvalue] = params[:search][:value].dup
      redirect_to band_search_url
    elsif params[:search][:category] == 'albums'
      flash[:searchvalue] = params[:search][:value].dup
      redirect_to album_search_url
    elsif params[:search][:category] == 'tracks'
      flash[:searchvalue] = params[:search][:value].dup
      redirect_to track_search_url
    else
      flash[:errors] =  ["wtf r u searching for m8"]
      redirect_to bands_url
    end
  end

end
