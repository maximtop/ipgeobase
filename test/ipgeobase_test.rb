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
    stub_request(:get, "http://ip-api.com/xml/8.8.8.8")
      .to_return(status: 200, body: File.read("test/fixtures/response.xml"), headers: {})

    ip_meta = Ipgeobase.lookup("8.8.8.8")

    assert_equal(expected_city, ip_meta.city)
    assert_equal(expected_country, ip_meta.country)
    assert_equal(expected_country_code, ip_meta.country_code)
    assert_equal(expected_lat, ip_meta.lat)
    assert_equal(expected_lon, ip_meta.lon)
  end
end

# rubocop:enable Metrics/MethodLength
