# team.rb

class Team
  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def self.delete_all()
  end

  def self.delete_one(id)
  end

  def self.select_all()
  end

  def self.select_one(id)
  end




  def insert()
    sql = 'INSERT INTO teams (name) VALUES ($1) RETURNING id;'
    values = [@name]
    sql_result = SqlRunner.run(sql, values)
    @id = sql_result[0]['id']
  end

  def update()
  end



end

# team.rb
