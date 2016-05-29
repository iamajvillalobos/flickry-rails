class FlickrSearch
  NO_IMAGE_FOUND = "http://placehold.it/500x375?text=No+Image+Found"

  def self.search_for_photos(search_result)
    images = search_flickr(search_result)
    generate_response(images)
  end

  def self.search_flickr(search_result)
    flickr.photos.search(text: search_result.query, per_page: 24)
  end

  def self.generate_response(results_from_flickr)
    response = []
    results_from_flickr.each do |image|
      thumbnail_photo = get_thumbnail_photo(image)
      link_url = get_link_url(image)
      response << { thumbnail_photo: thumbnail_photo, link_url: link_url }
    end
    response
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
