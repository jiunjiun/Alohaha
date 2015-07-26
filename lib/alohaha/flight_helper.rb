module Flight_helper
  def filter_kind
    {
      Arrivals: self.select {|flights| flights.kind == 'Arrivals'},
      Departure: self.select {|flights| flights.kind == 'Departure'}
    }
  end
end

class Array
  include Flight_helper
end
