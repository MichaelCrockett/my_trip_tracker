require_relative('../db/sql_runner')
require_relative('./sight')
require_relative('./country')
require_relative('./trip')
require_relative('./city')

class City

  attr_accessor :name, :country_id
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @country_id = options['country_id']
  end



  def save()
    sql = "INSERT INTO cities
    (name, country_id) VALUES
    ($1, $2)
    RETURNING id"
    values = [@name, @country_id]
    @id = SqlRunner.run( sql, values )[0]["id"].to_i()
  end



  def self.all()
    sql = "SELECT * FROM cities"
      city_data = SqlRunner.run(sql)
    return City.map_items(city_data)
  end


  def update()
      sql = "UPDATE cities
      SET (name, country_id) =
      ($1, $2)
      WHERE id = $3"
      values = [@name, @country_id, @id]
      SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM cities"
    SqlRunner.run(sql)
  end


  def self.map_items(city_data)
      return city_data.map { |city| City.new(city) }
  end

  def self.find(id)
    sql = "SELECT * FROM cities
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    city = City.new(result)
    return city
  end

  def country
    sql = "SELECT * FROM countries WHERE id = $1"
    values = [@country_id]
    result = SqlRunner.run(sql, values).first
    return Country.new(result)
  end




end #class end
