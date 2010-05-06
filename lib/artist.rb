class Artist
  attr_accessor :name, :playcount, :url
    
  def initialize(item)
    self.name = item.elements['name'].get_text
    self.playcount = item.elements['playcount'].get_text
    self.url = item.elements['url'].get_text
  end
end