require_relative('../db/sql_runner.rb')
require_relative('./album.rb')

class Artist

  attr_reader :id
  attr_accessor :name


def initialize(artist)
  @id = artist['id'].to_i() if artist['id']
  @name = artist['name']
end

def Artist.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

def save()
  sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
  values = [@name]
  returned_array = SqlRunner.run(sql, values)
  artist_hash = returned_array[0]
  id_string = artist_hash['id']
  @id = id_string.to_i
end

end
