class Array
  def arrivals
    self.select {|flights| flights.kind == 'Arrivals' }
  end

  def departure
    self.select {|flights| flights.kind == 'Departure' }
  end

  def yesterday
    self.select {|flights| flights.datetime.to_time >= Date.today.prev_day.to_time && flights.datetime.to_time <= Date.today.to_time }
  end

  def today
    self.select {|flights| flights.datetime.to_time >= Date.today.to_time && flights.datetime.to_time <= Date.today.next_day.to_time }
  end

  def tomorrow
    self.select {|flights| flights.datetime.to_time >= Date.today.next_day.to_time }
  end

  def by_datetime(datetime = DateTime.now)
    self.select {|flights| flights.datetime > datetime }
  end

  def filter_kind
    {
      Arrivals: self.select {|flights| flights.kind == 'Arrivals'},
      Departure: self.select {|flights| flights.kind == 'Departure'}
    }
  end
end
