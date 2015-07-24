Alohaha

This API helper get Taoyuan airport flight info

#Installation

Add this line to your application's Gemfile:

```ruby
gem 'alohaha'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install alohaha

#Usage

```ruby
require 'alohaha'
```

### All flights
```
haha = Alohaha.new

haha.flights # All flights
```

###Flight attribute

```
p haha.flights.first
```

```
@raw=["2", "A", "CI", "中華航空", "109", "B9", "2015/07/24", "00:05:00", "2015/07/24", "00:15:00", "NRT", "Tokyo", "東京", "已到ARRIVED", "B737-800", "", "", "", "", ""], 
@terminal="T2", 
@kind="Arrivals", 
@code="CI", 
@code_zh="中華航空", 
@flight="109", 
@gate="B9", 
@datetime=#<DateTime: 2015-07-24T00:05:00+00:00 ((2457228j,300s,0n),+0s,2299161j)>, 
@expected_datetime=#<DateTime: 2015-07-24T00:15:00+00:00 ((2457228j,900s,0n),+0s,2299161j)>, 
@destination=#<Destination:0x007febbb3e40a0 
  @iata="NRT", 
  @en="Tokyo", 
  @zh="東京">, 
@flight_status="已到ARRIVED", 
@aircraft_type="B737-800", 
@other_route=#<Destination:0x007febba876cb8 
  @iata="", 
  @en="", 
  @zh="">, 
@baggage_carousel="", 
@check_in_counter=""
```

or

```
p haha.flights.first.terminal # "T2"
```

### Arrivals
```
p haha.arrivals
```

### Departure
```
p haha.departure
```

#Contributing

1. Fork it ( https://github.com/[my-github-username]/alohaha/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
