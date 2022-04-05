unless Rails.env.development?
  Rails.logger = ActiveSupport::BufferedLogger.new(Rails.root.join("log","#{Rails.env}.log"))
end