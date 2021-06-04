# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength

require "test_helper"

class IpgeobaseTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def test_it_does_something_useful
    expected_city = "Ashburn"
    expected_country = "United States"
    expected_country_code = "US"
    expected_lat = "39.03"
    expected_lon = "-77.5"
    xml_response = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
      <query>
           <status>success</status>
           <country>#{expected_country}</country>
           <countryCode>#{expected_country_code}</countryCode>
           <region>VA</region>
           <regionName>Virginia</regionName>
           <city>#{expected_city}</city>
           <zip>20149</zip>
           <lat>#{expected_lat}</lat>
           <lon>#{expected_lon}</lon>
           <timezone>America/New_York</timezone>
           <isp>Google LLC</isp>
           <org>Google Public DNS</org>
           <as>AS15169 Google LLC</as>
           <query>8.8.8.8</query>
       </query>"
    stub_request(:get, "http://ip-api.com/xml/8.8.8.8")
      .to_return(status: 200, body: xml_response, headers: {})

    ip_meta = Ipgeobase.lookup("8.8.8.8")
    assert_equal(ip_meta.city, expected_city)
    assert_equal(ip_meta.country, expected_country)
    assert_equal(ip_meta.country_code, expected_country_code)
    assert_equal(ip_meta.lat, expected_lat)
    assert_equal(ip_meta.lon, expected_lon)
  end
end

# rubocop:enable Metrics/MethodLength
