require_relative('../db/sql_runner')

class Country

  attr_accessor :name
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end


  def save()
    sql = "INSERT INTO countries
    (name) VALUES
    ($1)
    RETURNING id"
    values = [@name]
    @id = SqlRunner.run( sql, values )[0]["id"].to_i()
  end


  def self.delete_all()
    sql = "DELETE FROM countries"
    SqlRunner.run(sql)
  end

end #class end
