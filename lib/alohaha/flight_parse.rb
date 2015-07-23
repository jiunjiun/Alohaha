module FlightParse
  # attr_accessor :url, :flights

  def source_url(url = nil)
    @url = url.nil? || url.length == 0 ? Settings::FLIGHT_URL : url
  end

  def flights_parse
    @flights = []

    ic = Iconv.new('UTF-8', 'BIG5')
    row_data = ic.iconv(open(@url).read)
    row_data.each_line do |line|
      @flights << Flight.new(line.split(',').map {|al| al = al.strip})
    end
  end
end
