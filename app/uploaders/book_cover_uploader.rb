# encoding: utf-8

class BookCoverUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # storage :fog
  storage :file
  process resize_to_fit: [800, 800]

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    # "/images/fallback/" + [version_name, "default.png"].compact.join('_')
    ActionController::Base.helpers.asset_path('book.png')
  end

  version :thumb do
    process resize_to_fit: [50, 50]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
