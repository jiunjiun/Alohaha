module FlightParse
  attr_accessor :url, :airlines

  def source_url(url = nil)
    @url = url.nil? || url.length == 0 ? Settings::FLIGHT_TXT_URL : url
  end

  def parse_flight
    ic = Iconv.new('UTF-8', 'BIG5')
    row_data = ic.iconv(open(@url).read)
    row_data.each_line do |line|
      @airlines << line.split(',').map {|al| al = al.strip}
    end
  end
end
