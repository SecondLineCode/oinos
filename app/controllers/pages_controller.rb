class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:search]

  def search
    # http://ruby-doc.org/stdlib-2.0.0/libdoc/open-uri/rdoc/OpenURI.html
    require 'open-uri'

  if params[:search]
    # Construct the URL we'll be calling
    request_uri = 'http://services.wine.com/api/beta2/service.svc/json/catalog?apikey=c880d81f0c6e496f2605bead17ddd36c'
    request_type = '&size=10&search='
    request_query = "#{params[:search]}"
    url = "#{request_uri}#{request_type}'#{request_query}'"

    # Actually fetch the contents of the remote URL as a String.
    encoded_url = URI.encode(url)
    buffer = URI.parse(encoded_url).read

    # Convert the String response into a plain old Ruby array. It is faster and saves you time compared to the standard Ruby libraries too.
    @result = JSON.parse(buffer)
    @products = @result["Products"]["List"]

    #TODO:  figure out how to grab the thumbnail or larger image, not the first image.
    #TODO:  handle bad searches that either return nothing or return empty fields on the ones shown.
  else
    @products = Array.new
  end


  end
end
