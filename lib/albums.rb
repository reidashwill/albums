require ('pry')

class Album
  attr_reader :id, :name
  attr_accessor :name
  @@albums = {}
  @@total_rows = 0

  # def ==(other_album)
  #   self.name.eql?(other_album_name) && self.artist.eql?(other_album.artist) && self.year.eql?(other_album.year)
  # end
  
  def initialize(name, id)
    @name = name
    @id = id || @@total_rows += 1
  end
  
  def self.all()
    @@albums.values()
  end
  
  def save
    @@albums[self.id] = Album.new(self.name, self.id)
  end  

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end
 
  def self.clear
    @@albums = {}
    @@total_rows = 0 
  end

  def self.find(id)
    @@albums[id]
  end
  
  def update(name)
    @name = name
  end

  def delete
    @@albums.delete(self.id)
  end

end