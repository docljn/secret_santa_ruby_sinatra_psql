# team.rb

class Team
  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def self.delete_all()
    sql = 'DELETE FROM teams;'
    sql_result = SqlRunner.run(sql)
  end

  def self.delete_one(id)
    sql = 'DELETE FROM teams WHERE id = $1;'
    values = [id]
    sql_result = SqlRunner.run(sql, values)
  end

  def self.select_all()
    sql = 'SELECT * FROM teams;'
    sql_result = SqlRunner.run(sql)
    teams_array = sql_result.map {|hash| Team.new(hash)}
  end

  def self.select_one(id)
    sql = 'SELECT * FROM teams WHERE id = $1;'
    values = [id]
    sql_result = SqlRunner.run(sql, values)
    team = Team.new(sql_result[0])
  end


  def insert()
    sql = 'INSERT INTO teams (name) VALUES ($1) RETURNING id;'
    values = [@name]
    sql_result = SqlRunner.run(sql, values)
    @id = sql_result[0]['id']
  end

  def update()
    sql = 'UPDATE teams SET name = $1 WHERE id = $2;'
    values = [@name, @id]
    sql_result = SqlRunner.run(sql, values)
  end



end

# team.rb
