require 'open-uri'
require 'iconv'

module FlightParse
    attr_accessor :url, :airlines



  def parse_flight
    ic = Iconv.new('UTF-8', 'BIG5')
    row_data = ic.iconv(open(@url).read)
    row_data.each_line do |line|
      @airlines << line.split(',').map {|al| al = al.strip}
    end
  end
end
