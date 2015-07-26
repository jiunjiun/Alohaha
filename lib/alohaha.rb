require 'open-uri'
require 'iconv'
require 'virtus'

require "alohaha/settings"
require "alohaha/flight"
require "alohaha/flight_parse"

class Alohaha
  include FlightParse

  def initialize(option = {})
    source_url(option[:source_url])
    flights_parse
  end

  def flights
    @flights
  end

  def arrivals
    @flights.select {|flights| flights.kind == 'Arrivals' }
  end

  def departure
    @flights.select {|flights| flights.kind == 'Departure' }
  end

  def yesterday
    @flights.select {|flights| flights.datetime > Date.today.prev_day && flights.datetime < Date.today }
  end

  def today
    @flights.select {|flights| flights.datetime > Date.today && flights.datetime < Date.today.next_day }
  end

  def tomorrow
    @flights.select {|flights| flights.datetime > Date.today.next_day }
  end

  def by_datetime(datetime = DateTime.now)
    @flights.select {|flights| flights.datetime > datetime }
  end
end
