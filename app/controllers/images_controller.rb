class ImagesController < ApplicationController
  before_action :get_user
  before_action :upload_image, only: [:create]

  def show
    send_data(@user.image.data,
    filename: @user.image.name,
    disposition: "inline")
  end

  def create
    @user.image.destroy if @user.image
  	@user.image = Image.new(user_id: @user.id, name: @uploaded.original_filename, data: @uploaded.read)
  	redirect_to @user
  end

  private

  def get_user
  	@user = User.find(params[:user_id])
  end

  def upload_image
    @uploaded = params[:user][:image]
  end

end
