class DestinationHaha
  include Virtus.model

  attribute :iata,  String
  attribute :en,    String
  attribute :zh,    String
end

class FlightHaha
  include Virtus.model

  attribute :terminal,          String    #1: T1, 2:T2
  attribute :kind,              String    #A: Arrivals, D: Departure
  attribute :code,              String
  attribute :code_zh,           String
  attribute :flight,            String
  attribute :gate,              String

  attribute :datetime,          DateTime
  attribute :expected_datetime, DateTime

  attribute :destination,       DestinationHaha
  attribute :flight_status,     String

  attribute :aircraft_type,     String
  attribute :other_route,       DestinationHaha
  attribute :baggage_carousel,  String
  attribute :check_in_counter,  String

  attribute :raw,               Array


  def initialize(raw_data)
    self.raw = raw_data

    # terminal
    self.terminal = "T#{raw_data[0]}"

    # kind
    case raw_data[1]
    when "A"
      self.kind = "Arrivals"
    when "D"
      self.kind = "Departure"
    end

    # code
    self.code = raw_data[2]

    # code
    self.code_zh = raw_data[3]

    # flight
    self.flight = raw_data[4]

    # gate
    self.gate = raw_data[5]

    # datetime
    self.datetime = "#{raw_data[6]} #{raw_data[7]} +08:00"

    # expected_datetime
    self.expected_datetime = "#{raw_data[8]} #{raw_data[9]} +08:00"

    # destination
    self.destination = DestinationHaha.new(iata: raw_data[10], en: raw_data[11], zh: raw_data[12])

    # flight_status
    self.flight_status = raw_data[13]

    # aircraft_type
    self.aircraft_type = raw_data[14]

    # other_route
    self.other_route = DestinationHaha.new(iata: raw_data[15], en: raw_data[16], zh: raw_data[17])

    # baggage_carousel
    self.baggage_carousel = raw_data[18]

    # check_in_counter
    self.check_in_counter = raw_data[19]
  end
end


