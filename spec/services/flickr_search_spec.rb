require 'rails_helper'

describe "Flickr Search API" do
  context "::search_for_photos" do
    it "generates an array of photos" do
      query = SearchResult.new(query: "bike")
      search_result = FlickrSearch.search_for_photos(query)
      expect(search_result).to be_an_instance_of(Array)
      expect(search_result.size).to be > 0
    end
  end

  context "::search_flickr" do
    it "returns a FlickRaw object" do
      query = SearchResult.new(query: "bike")
      response = FlickrSearch.search_flickr(query)
      expect(response).to be_an_instance_of(FlickRaw::ResponseList)
    end
  end

  context "::get_thumbnail_photo" do
    it "returns a link to an image" do
      sample_payload = {"id"=>"27251420461", "owner"=>"104640308@N03", "secret"=>"d5e99b4f03", "server"=>"7638", "farm"=>8, "title"=>"2016-05/29 on 石門 轉腳趣……強大的\"海轟\" 加上熱死人不償命的天氣(>_<)", "ispublic"=>1, "isfriend"=>0, "isfamily"=>0}
      Response = Struct.new(:id)
      payload = Response.new(sample_payload["id"])
      response = FlickrSearch.get_thumbnail_photo(payload)
      expect(response).to be_an_instance_of(String)
    end
  end

  context "::get_link_url" do
    it "returns a url to the flickr original result page" do
      sample_payload = {"id"=>"27251420461", "owner"=>"104640308@N03", "secret"=>"d5e99b4f03", "server"=>"7638", "farm"=>8, "title"=>"2016-05/29 on 石門 轉腳趣……強大的\"海轟\" 加上熱死人不償命的天氣(>_<)", "ispublic"=>1, "isfriend"=>0, "isfamily"=>0}
      PayloadResponse = Struct.new(:id)
      payload = Response.new(sample_payload["id"])
      response = FlickrSearch.get_link_url(payload)
      expect(response).to be_an_instance_of(String)
    end
  end
end
