class FlickrSearch
  NO_IMAGE_FOUND = "http://placehold.it/500x375?text=No+Image+Found"

  def self.search_for_photos(search_result)
    results = []
    images = flickr.photos.search(text: search_result.query, per_page: 24)
    images.each do |image|
      thumbnail_photo = get_thumbnail_photo(image)
      link_url = get_link_url(image)
      results << {
        thumbnail_photo: thumbnail_photo,
        link_url: link_url
      }
    end
    results
  end

  def self.get_thumbnail_photo(photo)
    result = flickr.photos.getSizes(photo_id: photo.id)
    image = result.find { |s| s.label == 'Medium' }
    image ? image.source : no_image_found
  end

  def self.get_link_url(image)
    info = flickr.photos.getInfo(photo_id: image.id)
    info.urls.first["_content"]
  end
end
