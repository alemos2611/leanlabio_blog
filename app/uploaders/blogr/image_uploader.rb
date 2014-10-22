# encoding: utf-8

class Blogr::ImageUploader < CarrierWave::Uploader::Base

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

  # Create different versions of your uploaded files:
  version :large do
    # returns a 150x150 image
    process :resize_to_limit => [800, 800]
  end
  version :medium do
    # returns a 50x50 image
    process :resize_to_limit => [400, 400]
  end
  version :small do
    # returns a 35x35 image
    process :resize_to_limit => [100, 100]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
