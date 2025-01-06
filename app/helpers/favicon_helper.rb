module FaviconHelper
  def favicon_image_tag(url, **kwargs)
    image_tag(favicon_url(url), **kwargs)
  end

  def favicon_url(domain)
    "https://www.google.com/s2/favicons?domain=#{domain}"
  end
end
