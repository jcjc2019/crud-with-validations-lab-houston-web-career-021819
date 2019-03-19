class SongsController < ApplicationController
    def index
        @songs = Song.all
    end

    def show
        @song = Song.find(params[:id])
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(song_params[:song])
        if @song.valid?
            @song.save
            redirect_to @song
        else
            render :new
        end
    end

    def edit
        @song = Song.find(params[:id])
    end

    def update
        @song = Song.find(params[:id])
        @song.assign_attributes(song_params[:song])
        if @song.valid?
            @song.save
            redirect_to @song
        else
            render :edit
        end
    end
    
    def destroy
        @song = Song.find(params[:id])
        @song.destroy
        redirect_to songs_path
    end

    def song_params
        params.permit(song: [:title, :released, :release_year, :artist_name, :genre])
    end
end
