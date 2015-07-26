require 'open-uri'
require 'iconv'
require 'virtus'

require "alohaha/settings"
require "alohaha/flight"
require "alohaha/flight_parse"
require 'alohaha/flight_helper'

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
    @flights.select {|flights| flights.datetime.to_time > Date.today.prev_day.to_time && flights.datetime.to_time < Date.today.to_time }
  end

  def today
    @flights.select {|flights| flights.datetime.to_time > Date.today.to_time && flights.datetime.to_time < Date.today.next_day.to_time }
  end

  def tomorrow
    @flights.select {|flights| flights.datetime.to_time > Date.today.next_day.to_time }
  end

  def by_datetime(datetime = DateTime.now)
    @flights.select {|flights| flights.datetime > datetime }
  end
end
