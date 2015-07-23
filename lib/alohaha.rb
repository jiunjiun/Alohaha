require 'open-uri'
require 'iconv'
require 'activerecord'

require "alohaha/settings"
require "alohaha/flight_parse"

class Alohaha
  include FlightParse

  def initialize(option = {})
    @airlines = []

    source_url(option[:source_url])
    parse_flight
  end

  def airlines
    @airlines
  end
end

