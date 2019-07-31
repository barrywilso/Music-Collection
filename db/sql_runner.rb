require('pg')

class SqlRunner

  def self.run(sql, values = [])

    begin
      db =PG.connect({dbname: 'collections', host: 'localhost'})
      db.type_map_for_results = PG::BasicTypeMapForResults.new(db)
      db.prepare("query", sql)
      result = db.exec_prepared('query', values)
    ensure
      db.close()
    end

    return result
  end

end
