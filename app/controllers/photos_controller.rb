class PhotosController < ApplicationController
  before_action :set_user, except: [:index]
  before_action :authenticate, except: [:index, :show]

  def index
    @photos = Photo.all
  end

  def show
    @photo = @user.photos.find(params[:id])
  end

  def new
    @photo = @user.photos.new
  end

  def create
    @photo = @user.photos.new(photo_params)
    if @photo.save
      redirect_to user_my_photo_path(@photo.user_id, @photo.id)
    else
      render :new
    end
  end

  def edit
    @photo = @user.photos.find(params[:id])
  end

  def update
    @photo = @user.photos.find(params[:id])
    if @photo.update(photo_params)
      redirect_to user_my_photos_path(@photo.user_id)
    else
      render :edit
    end
  end

  def destroy
    @photo = @user.photos.find(params[:id])
    @photo.destroy
    redirect_to photos_path
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end

  def photo_params
    params.require(:photo).permit(:title, :url, :user_id)
  end

end
