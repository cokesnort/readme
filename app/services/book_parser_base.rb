class BookParserBase
  def initialize(path)
    content = EncodingConverter.new(path).call

    @file = Tempfile.new('book')
    @file.write(content)
    @file.pos = 0
  end

  def header
    fail('Not implemented.')
  end
end
