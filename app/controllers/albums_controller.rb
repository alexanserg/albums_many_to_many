class AlbumsController < ApplicationController

  def index
    @albums = Album.all
    render :index
  end

  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      flash[:notice] = "Album successfully created!"
      redirect_to albums_path
    else
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    flash[:notice] = "Album successfully edited!"
    render :edit
  end

  def show
    @album = Album.find(params[:id])
    @artists = @album.artists
    render :show
  end

  def update
    @album = Album.find(params[:id])
    # this is making the artist - album association work
    #if a parameter came in that includes artist name
    if params[:artist_name]
      #make a new artist object, using the album object, and set its name to the string

      artist = @album.artists.new(:name => params[:artist_name])
      #this will be applied below at @album.update
    end
    if @album.update(album_params)
      flash[:notice] = "Album successfully updated!"
      redirect_to albums_path
    else
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    flash[:notice] = "Album successfully destroyed"
    redirect_to albums_path
  end

  private
    def album_params
      params.require(:album).permit(:name, :genre)
    end

end
