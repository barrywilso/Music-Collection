require_relative('../db/sql_runner.rb')
require_relative('./artist.rb')

class Album

  attr_reader :id
  attr_accessor :title, :genre, :artist_id

  def initialize(album)
    @id = album['id'].to_i() if album['id']
    @title = album['title']
    @genre = album['genre']
    @artist_id = album['artist_id'].to_i
  end

  def Album.delete_all()
      sql = "DELETE FROM albums"
      SqlRunner.run(sql)
    end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @genre, @artist_id]
    result = SqlRunner.run(sql,values)
    @id = result[0]['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM albums"
    SqlRunner.run(sql)
    return orders.map{|order| Album.new(order)}
  end

end
