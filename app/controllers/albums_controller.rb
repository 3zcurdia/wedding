# frozen_string_literal: true

class AlbumsController < ApplicationController
  before_action :set_album, only: %i[show update]
  layout "pages"

  def show; end

  def update
    if @album.add_photos(album_params[:photos])
      redirect_to album_url(@album), notice: "Photos was successfully added to album."
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def set_album
    @album = Album.find_by!(slug: params[:slug])
  end

  def album_params
    params.require(:album).permit(photos: [])
  end
end
