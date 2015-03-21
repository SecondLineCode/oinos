class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:search]

  def search
    # http://ruby-doc.org/stdlib-2.0.0/libdoc/open-uri/rdoc/OpenURI.html
    require 'open-uri'

  if params[:search]
    # Construct the URL we'll be calling
    request_uri = 'http://services.wine.com/api/beta2/service.svc/json/catalog?apikey=c880d81f0c6e496f2605bead17ddd36c'
    request_type = '&size=10&type="wine"&search='
    request_query = "#{params[:search]}"
    url = "#{request_uri}#{request_type}'#{request_query}'"

    # Actually fetch the contents of the remote URL as a String.
    encoded_url = URI.encode(url)
    buffer = URI.parse(encoded_url).read

    # Convert the String response into a plain old Ruby array. It is faster and saves you time compared to the standard Ruby libraries too.
    @result = JSON.parse(buffer)
    @raw_products = @result["Products"]["List"]
    @products = Array.new

    @raw_products.each do |wine|
      # Filter out other products
      if wine["Type"] == "Wine"
        new_wine = Hash.new
        new_wine["label"] = wine["Labels"][0]["Url"]
        new_wine["name"] = wine["Name"]
        new_wine["vineyard"] = wine["Vineyard"]["Name"]
        new_wine["url"] = wine["Url"]
        new_wine["appellation_region"] = wine["Appellation"]["Region"]["Name"]
        new_wine["appellation_name"] = wine["Appellation"]["Name"]
        new_wine["varietal_type"] = wine["Varietal"]["WineType"]["Name"]
        new_wine["varietal_name"] = wine["Varietal"]["Name"]
        new_wine["pricemin"] = wine["PriceMin"]
        new_wine["pricemax"] = wine["PriceMax"]
        new_wine["attributes"] = Array.new
        wine["ProductAttributes"].each do |attribute|
          new_wine["attributes"] << attribute["Name"]
        end
        @products << new_wine
      end
    end

    #TODO:  figure out how to grab the thumbnail or larger image, not the first image.
  else
    @products
  end


  end
end
