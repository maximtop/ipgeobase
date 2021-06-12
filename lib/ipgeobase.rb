# frozen_string_literal: true

require "uri"
require "net/http"
require "happymapper"

require_relative "ipgeobase/version"
require_relative "ipgeobase/ip_meta"

# Ipgeobase - allows you to get data by ip address
module Ipgeobase
  class Error < StandardError; end

  def self.lookup(ip_address)
    api = "http://ip-api.com/xml"
    url = "#{api}/#{ip_address}"

    uri = URI(url)
    res = Net::HTTP.get_response(uri)
    result = res.body if res.is_a?(Net::HTTPSuccess)
    raise "Was unable to get ip data" if result.nil?

    Ipgeobase::Ipmeta.parse(result)
  end
end
