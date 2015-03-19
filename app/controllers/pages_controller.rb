class PagesController < ApplicationController
  def search
    # http://ruby-doc.org/stdlib-2.0.0/libdoc/open-uri/rdoc/OpenURI.html
    require 'open-uri'

    # Construct the URL we'll be calling
    request_uri = 'http://services.wine.com/api/beta2/service.svc/json/catalog?apikey=c880d81f0c6e496f2605bead17ddd36c'
    request_query = '&search="mondavi"&size=5'
    url = "#{request_uri}#{request_query}"

    # Actually fetch the contents of the remote URL as a String.
    encoded_url = URI.encode(url)
    buffer = URI.parse(encoded_url).read

    # Convert the String response into a plain old Ruby array. It is faster and saves you time compared to the standard Ruby libraries too.
    @result = JSON.parse(buffer)
    @products = @result["Products"]["List"]

    #TODO:  figure out how to grab the thumbnail or larger image, not the first image
  end
end
