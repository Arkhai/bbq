class PhotoUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Фотографию надо обрезать и уменьшить так, чтобы получился квадрат 800x800
  process resize_to_fit: [800, 800]

  # А потом нужно сделать миниатюрную версию 100x100
  version :thumb do
    process :resize_to_fit => [100, 100]
  end

  # Мы разрешаем для загрузки только картинки
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
