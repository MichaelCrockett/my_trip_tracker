require_relative('../db/sql_runner')
require_relative('./sight')
require_relative('./city')
require_relative('./trip')


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

  def self.all()
    sql = "SELECT * FROM countries"
    country_data = SqlRunner.run(sql)
    return Country.map_items(country_data)
  end

  def update()
      sql = "UPDATE countries
             SET name = $1
             WHERE id = $2"
      values = [@name, @id]
      SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM countries"
    SqlRunner.run(sql)
  end

  def self.map_items(country_data)
      return country_data.map { |country| Country.new(country) }
  end

  def self.find(id)
    sql = "SELECT * FROM countries
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    country = Country.new(result)
    return country
  end


def self.find(id)
  sql = "SELECT * FROM countries
  WHERE id = $1"
  values = [id]
  result = SqlRunner.run(sql, values).first
  country = Country.new(result)
  return country
end

end #class end
