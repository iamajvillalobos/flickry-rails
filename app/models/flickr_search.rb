class FlickrSearch
  def self.search_for_photos(search_result)
    results = []
    images = flickr.photos.search(text: search_result.query, per_page: 25)
    images.each do |image|
      details = get_photo_details(image)
      results << get_photo_images(details)
    end
    results
  end

  def self.get_photo_details(image)
    flickr.photos.getSizes(photo_id: image.id)
  end

  def self.get_photo_images(image)
    [find_thumbnail_photo(image), find_large_photo(image)]
  end

  def self.find_thumbnail_photo(photo)
    photo.find { |s| s.label == 'Thumbnail' }.source
  end

  def self.find_large_photo(photo)
    large_photo = photo.find { |s| s.label == 'Original' || s.label == 'Large' }
    large_photo ? large_photo.source : "no large photo"
  end
end
