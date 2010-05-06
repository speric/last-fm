require 'net/http'
require 'rexml/document'

class LastFm
  
  #takes your last.fm username as the parameter
  def initialize(username)
    @startpoint = "http://ws.audioscrobbler.com/2.0/user/#{username}/"
  end
  
  #get the topartists for the last 3, 6, 9 or 12 months.  Passing no parameter returns the top artists overall
  def topartists(duration = 0)
    response = send_request("topartists.xml?period=#{duration}month")
    parse_response(response, 'topartists/artist')
  end

  #latest weekly aritst chart
  def weeklyartistchart
    response = send_request("weeklyartistchart.xml")
    parse_response(response, 'weeklyartistchart/artist')
  end
  
  private
  
  def send_request(endpoint)
    REXML::Document.new(Net::HTTP.get_response(URI.parse("#{@startpoint}#{endpoint}")).body)
  end
  
  def parse_response(items, parse_on)
    items.elements.collect(parse_on){|i| Artist.new(i)}
  end
end