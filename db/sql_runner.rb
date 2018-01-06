# sql_runner.rb

require 'PG'

class SqlRunner

  self.run = self.run_development if development?

  def self.run(sql, values=[])
    begin
      db = PG.connect({dbname: 'santa', host: 'localhost'})
      db.prepare('query', sql)
      result = db.exec_prepared('query', values)
    ensure
      db.close() if db != nil
    end
    return result
  end

  def self.run_development(sql, values=[])
    begin
      db = PG.connect(dbname: 'santa_test', host: 'localhost')
      db.prepare('query', sql)
      result = db.exec_prepared('query', values)
    ensure
      db.close() if db != nil
    end
    return result
  end

end






# sql_runner.rb
