class EncodingConverter
  def initialize(path)
    @path = path
  end

  def call
    File.open(@path, encoding: 'utf-8') do |file|
      xml_header = file.readline
      encoding = Nokogiri::Slop(xml_header).encoding
      File.read(@path, encoding: "#{encoding}:utf-8")
    end
  end
end
