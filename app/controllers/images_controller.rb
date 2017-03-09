class ImagesController < ApplicationController
  before_action :get_user
  before_action :upload_image, only: [:create]

  def create
  	@user.image = Image.new(user_id: @user.id, source: @uploaded.original_filename)
  	redirect_to @user
  end

  private
  def get_user
  	@user = User.find(params[:user_id])
  end

  def upload_image
    @uploaded = params[:user][:image]
	  File.open(Rails.root.join(relative_path, @uploaded.original_filename), 'wb') do |file|
	  file.write(@uploaded.read)
	end
  end

  def relative_path
  	File.join("app", "assets", "images")
  end

end
