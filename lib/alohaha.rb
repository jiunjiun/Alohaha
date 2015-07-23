require "alohaha/flight_parse"
require "alohaha/settings"

class Alohaha
  include Settings
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
