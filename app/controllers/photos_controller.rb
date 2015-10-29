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

  def edit
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to @photo
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

  # def get_user_id
  #   @user = Photo.find(params[:user_id]
  # end

  def photo_params
    params.require(:photo).permit(:id, :title, :user, :picture, :user_id)
  end

end