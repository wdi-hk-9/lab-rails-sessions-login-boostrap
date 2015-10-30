class PhotosController < ApplicationController
  before_action :set_photo_id, only: [:show, :edit, :update, :destroy]

  def index
    @photos = Photo.all
  end

  def show
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new photo_params
    if @photo.save
     redirect_to @photo
    else
     render 'new'
    end
  end

  def update
    @photo.update(photo_params)
    redirect_to @photo
  end

  def destroy
    @photo.destroy
    redirect_to photos_url
  end

  private
  def set_photo_id
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:picture, :title, :user_id)
  end
end
