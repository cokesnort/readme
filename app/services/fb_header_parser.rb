class FbHeaderParser < BookParserBase
  def call
    xml = Nokogiri::XML(@file, nil, 'UTF-8')

    title_info = xml.at_css('title-info')

    book = {
      authors:     title_info.css('author').map { |a| map_author(a) },
      translators: title_info.css('translator').map { |a| map_author(a) },
      title:       title_info.css('book-title').text,
      annotation:  title_info.css('annotation > p').text,
      genre:       title_info.css('genre').map(&:text),
      lang:        title_info.css('lang').text,
      keywords:    title_info.css('keywords').text,
      cover:       grab_image
    }

    book
  end

  private

  def grab_image
    @file.pos = 0
    base64 = @file.read.match(/binary.*image.*>(.*)<\/binary/m)[1].gsub("\n",'')

    Base64ToImage.new(base64).call
  end

  def map_author(author)
    {
      first_name:  author.css('first-name').text,
      middle_name: author.css('middle-name').text,
      last_name:   author.css('last-name').text,
      email:       author.css('email').text
    }
  end
end
