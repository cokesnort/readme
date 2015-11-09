class Base64ToImage
  def initialize(base64)
    @base64 = base64
  end

  def call(path = nil)
    image = path.present? ? File.new(path, 'wb') : Tempfile.new('image')
    image.binmode
    image.write(Base64.decode64(@base64))
    image.flush

    image
  end
end
