class Song < ActiveRecord::Base
  belongs_to :album
  belongs_to :artist

  def self.browse(search)
    find(:all, :conditions => ['album_id LIKE ?',"#{search}"])
  end

  def self.find_top_songs()
    top_100_url = "http://api.billboard.com/apisvc/chart/v1/list?id=379&api_key=w3a5as9mdhnnzu6s4nbj2kja"
    @pull = Nokogiri::XML(open(top_100_url))
    @top_100_artists = @pull.xpath('//chartItem/artist')
    @top_100_artists.each do |artist|
      @search_artists = Artist.find(:all, :conditions =>{:name =>artist.children.text.upcase})
      if @search_artists != [] and @search_artists.first != nil
      end
    @top_100_songs = @pull.xpath('//chartItem/song')
    end 
    puts @top_100
  end


  
  #def self.title(search)
  #  find(:all, :conditions => ['title LIKE ?', "#{search}%"])
  #end

  define_index do
    indexes title
  #  indexes lyrics
  end
  
end
