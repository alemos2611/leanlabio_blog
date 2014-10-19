# encoding: utf-8

class Blogr::AvatarUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  #storage :file
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    "blogr/avatar_default.png"
  end

  # Create different versions of your uploaded files:
  version :large_avatar do
    # returns a 150x150 image
    process :resize_to_fill => [150, 150]
  end
  version :medium_avatar do
    # returns a 50x50 image
    process :resize_to_fill => [50, 50]
  end
  version :small_avatar do
    # returns a 35x35 image
    process :resize_to_fill => [35, 35]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
