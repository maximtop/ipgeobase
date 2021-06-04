# frozen_string_literal: true

module Ipgeobase
  # IP metadata container
  class Ipmeta
    attr_reader :city, :country, :country_code, :lat, :lon

    def initialize(city, country, country_code, lat, lon)
      @city = city
      @country = country
      @country_code = country_code
      @lat = lat
      @lon = lon
    end
  end
end
