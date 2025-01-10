require "open-uri"

class Metadata
  def initialize(html = nil)
    @html = html
  end

  def self.retrieve_from(url)
    new(URI.open(url))
  rescue StandardError
    new
  end

  def attributes
    {
      title: title,
      description: description,
      image: image,
    }
  end

  def title
    doc.at_css("title")&.text
  end

  def description
    meta_tag_content(name: "description")
  end

  def image
    meta_tag_content(attribute: :property, name: "og:image")
  end

  private
    attr_reader :doc

    def doc
      @doc ||= Nokogiri::HTML(@html)
    end

    def meta_tag_content(attribute: :name, name:)
      doc.at_css("meta[#{attribute}='#{name}']")&.attributes&.fetch("content", nil)&.text
    end
end
