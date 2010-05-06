require 'net/http'
require 'rexml/document'

class LastFm
  def initialize(username)
    @startpoint = "http://ws.audioscrobbler.com/2.0/user/#{username}/"
    @topartists = Array.new
    @weeklyartists = Array.new
  end
  
  def topartists(duration = 0)
    response = send_request("topartists.xml?period=#{duration}month")
    parse_response(response, 'topartists/artist')
  end

  def weeklyartistchart
    response = send_request("weeklyartistchart.xml")
    parse_response(response, 'weeklyartistchart/artist')
  end
  
  private
  
  def send_request(endpoint)
    REXML::Document.new(Net::HTTP.get_response(URI.parse("#{@startpoint}#{endpoint}")).body)
  end
  
  def parse_response(items, parse_on)
    artists = Array.new
    items.elements.each(parse_on) do |i|
      artists << Artist.new(i)
    end
    artists
  end
end