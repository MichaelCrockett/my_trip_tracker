require_relative('../db/sql_runner')
require_relative('./trip')
require_relative('./city')
require_relative('./country')
class Sight

  attr_accessor :name, :city_id
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @city_id = options['city_id']
  end

  def save()
    sql = "INSERT INTO sights
    (
    name,
    city_id
    ) VALUES
    (
    $1, $2
    )
    RETURNING id"
    values = [@name, @city_id]
    @id = SqlRunner.run( sql, values )[0]["id"].to_i
  end

  def self.find(id)
    sql = "SELECT * FROM sights
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    sight = Sight.new(result)
    return sight
  end

  def self.all()
    sql = "SELECT * FROM sights"
    sight_data = SqlRunner.run(sql)
    return Sight.map_items(sight_data)
  end

  def self.map_items(sight_data)
      return sight_data.map { |sight| Sight.new(sight) }
  end

  def update()
      sql = "UPDATE sights
      SET name = $1,
      city_id = $2,
      country_id = $3
      WHERE id = $4"
      values = [@name, @city_id, @country_id, @id]
      SqlRunner.run(sql, values)
  end


  def self.delete_all()
    sql = "DELETE FROM sights"
    SqlRunner.run(sql)
  end




end
