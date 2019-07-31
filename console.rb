
require('pry-byebug')
require_relative('./models/artist.rb')
require_relative('./models/album.rb')

Artist.delete_all()
Album.delete_all()


artist1 = Artist.new(
  {
    'name' => 'Deacon Blue'
  }
)

artist2 = Artist.new(
  {
    'name' => 'Simple Minds'
  }
)

artist1.save()
artist2.save()

album1 = Album.new(
  {
    'title' => 'Raintown',
    'genre' => 'Rock',
    'artist_id' => artist1.id,
  }
)

album2 = Album.new(
  {
    'title' => 'New Gold dream',
    'genre' => 'Rock',
    'artist_id' => artist2.id,
  }
)

album1.save()
album2.save()

binding.pry
nil
