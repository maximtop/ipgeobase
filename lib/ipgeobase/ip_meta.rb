# frozen_string_literal: true

module Ipgeobase
  # IP metadata container
  class Ipmeta
    include HappyMapper

    tag "query"

    element :city, String, tag: "city"
    element :country, String, tag: "country"
    element :country_code, String, tag: "countryCode"
    element :lat, String, tag: "lat"
    element :lon, String, tag: "lon"
  end
end
