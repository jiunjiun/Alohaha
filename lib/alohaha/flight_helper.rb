class Array
  def filter_kind(flights)
    {
      Arrivals: flights.select {|flights| flights.kind == 'Arrivals'},
      Departure: flights.select {|flights| flights.kind == 'Departure'}
    }
  end
end
