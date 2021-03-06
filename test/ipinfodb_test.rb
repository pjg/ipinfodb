require 'test_helper'

class IpinfodbTest < Test::Unit::TestCase

  def test_invalid_api_key
    assert_raise ArgumentError, "INVALID API KEY" do
      Ipinfodb.api_key = "xxx"
      Ipinfodb.lookup("127.0.0.1")
    end
  end

  def test_missing_api_key
    assert_raise ArgumentError, "MISSING API KEY" do
      Ipinfodb.lookup("127.0.0.1")
    end
  end

  def test_valid_api_key
    puts "IPINFODB_API_KEY=<your_api_key> required to run this test" unless ENV["IPINFODB_API_KEY"]

    assert_nothing_raised do
      Ipinfodb.api_key = ENV["IPINFODB_API_KEY"]
      Ipinfodb.lookup("127.0.0.1")
    end
  end

  def test_geolocation
    puts "IPINFODB_API_KEY=<your_api_key> required to run this test" unless ENV["IPINFODB_API_KEY"]

    Ipinfodb.api_key = ENV['IPINFODB_API_KEY']
    response = Ipinfodb.lookup('153.19.48.1')

    assert_equal 'OK', response['statusCode']
    assert_equal 'POLAND', response['countryName']
    assert_equal 'PL', response['countryCode']
  end

end
