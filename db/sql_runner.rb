# sql_runner.rb

require 'pg'

class SqlRunner

  def self.run(sql, values=[], environment = 'test')
    begin
      if environment == 'development'
        database = 'santa'
        host_server = 'localhost'
      else environment == 'test'
        database = 'santa_test'
        host_server = 'localhost'
      end

      db = PG.connect({dbname: database, host: host_server})
      db.prepare('query', sql)
      result = db.exec_prepared('query', values)
    ensure
      db.close() if db != nil
    end
    return result
  end

end






# sql_runner.rb
